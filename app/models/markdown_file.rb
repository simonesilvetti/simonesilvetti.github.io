# A Markdown file with YAML front matter, for example:
#
#   ---
#   title: "Imparare Ruby"
#   date: 2026-10-07
#   description: "Appunti sul mio percorso con Ruby"
#   ---
#
#   Oggi ho iniziato a studiare Ruby.
#
# Post and Project inherit from this class. Each one reads its files from
# its own folder: Post from content/posts, Project from content/projects.
class MarkdownFile
  class NotFound < StandardError; end
  class Invalid < StandardError; end

  WORDS_PER_MINUTE = 200

  # Only letters, digits, "_" and "-": no "/" or "..", so a slug can never
  # point outside the content folder.
  SLUG_FORMAT = /\A[\w-]+\z/

  MARKDOWN_OPTIONS = {
    render: { unsafe: false, hardbreaks: false },
    extension: { header_ids: nil }
  }.freeze

  # The Rails sanitizer's safe tags, plus tables.
  ALLOWED_TAGS = Rails::HTML5::SafeListSanitizer.allowed_tags + %w[table thead tbody tr th td]

  attr_reader :slug, :metadata, :body

  def self.all
    Dir[directory.join("*.md")].map { |path| from_file(path) }.sort_by(&:date).reverse
  end

  def self.find(slug)
    path = directory.join("#{slug}.md")
    raise NotFound, "#{name} #{slug.inspect} not found" unless slug.to_s.match?(SLUG_FORMAT) && path.file?

    from_file(path)
  end

  def self.directory
    Rails.configuration.x.content_path.join(name.underscore.pluralize)
  end

  def self.from_file(path)
    new(slug: File.basename(path, ".md"), text: File.read(path))
  rescue Invalid => error
    raise Invalid, "#{path}: #{error.message}"
  end

  def initialize(slug:, text:)
    @slug = slug
    @metadata, @body = split_front_matter(text)

    raise Invalid, "title is missing" if title.blank?
    raise Invalid, "date is missing or invalid (use YYYY-MM-DD)" unless date
  end

  def title
    metadata["title"]
  end

  def description
    metadata["description"]
  end

  def date
    @date ||= Date.iso8601(metadata["date"].to_s)
  rescue Date::Error
    nil
  end

  def reading_time
    [ (body.split.size / WORDS_PER_MINUTE.to_f).ceil, 1 ].max
  end

  # Markdown -> HTML with Commonmarker, then cleaned by the Rails sanitizer.
  def html
    @html ||= ActionController::Base.helpers.sanitize(
      Commonmarker.to_html(content, options: MARKDOWN_OPTIONS, plugins: { syntax_highlighter: nil }),
      tags: ALLOWED_TAGS
    )
  end

  def to_param
    slug
  end

  private
    # A link from the front matter, only if https: a "javascript:" URL never reaches a page.
    def https_url(key)
      url = metadata[key].to_s
      url if url.start_with?("https://")
    end

    def split_front_matter(text)
      raise Invalid, "front matter is missing" unless text.start_with?("---")

      _, yaml, body = text.split(/^---\s*$/, 3)
      raise Invalid, "front matter is not closed with ---" if body.nil?

      metadata = YAML.safe_load(yaml, permitted_classes: [ Date ])
      raise Invalid, "front matter must be a list of key: value pairs" unless metadata.is_a?(Hash)

      [ metadata, body ]
    rescue Psych::Exception => error
      raise Invalid, "invalid YAML front matter (#{error.message})"
    end

    # The page already shows the title, so a leading "# Title" line is skipped.
    def content
      text = body.lstrip
      text.start_with?("# ") ? text.lines.drop(1).join : text
    end
end
