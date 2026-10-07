require "test_helper"

class PostTest < ActiveSupport::TestCase
  def build_post(text, slug: "example")
    Post.new(slug: slug, text: text)
  end

  test "reads all Markdown files, newest first" do
    assert_equal %w[newer-post older-post], Post.all.map(&:slug)
  end

  test "the slug comes from the file name" do
    assert_equal "older-post", Post.find("older-post").to_param
  end

  test "reads the YAML front matter" do
    post = Post.find("newer-post")

    assert_equal "Newer post", post.title
    assert_equal Date.new(2026, 2, 1), post.date
    assert_equal "Written second", post.description
    assert_equal [ "ruby" ], post.tags
  end

  test "converts Markdown to HTML" do
    html = Post.find("newer-post").html

    assert_includes html, "<strong>bold</strong>"
    assert_includes html, %(<a href="https://example.com">link</a>)
    assert_predicate html, :html_safe?
  end

  test "renders tables and code blocks" do
    html = build_post(<<~MD).html
      ---
      title: Tables
      date: 2026-01-01
      ---

      | a | b |
      |---|---|
      | 1 | 2 |

      ```ruby
      puts "hi"
      ```
    MD

    assert_includes html, "<table>"
    assert_includes html, "<td>1</td>"
    assert_includes html, %(<pre lang="ruby"><code>puts)
  end

  test "drops a leading # title, already shown by the page" do
    html = Post.find("newer-post").html

    assert_not_includes html, "<h1>"
  end

  test "removes scripts and javascript links" do
    html = Post.find("newer-post").html

    assert_not_includes html, "<script"
    assert_not_includes html, "javascript:"
  end

  test "sanitizes raw HTML even if Commonmarker lets it through" do
    post = build_post("---\ntitle: X\ndate: 2026-01-01\n---\n\ntext")
    def post.content = %(<img src="x" onerror="alert(1)"><a href="javascript:alert(1)">x</a>)

    assert_not_includes post.html, "onerror"
    assert_not_includes post.html, "javascript:"
  end

  test "estimates the reading time at 200 words per minute" do
    assert_equal 1, build_post("---\ntitle: X\ndate: 2026-01-01\n---\n\nshort").reading_time
    assert_equal 2, build_post("---\ntitle: X\ndate: 2026-01-01\n---\n\n#{"word " * 201}").reading_time
  end

  test "raises NotFound for a missing file" do
    assert_raises(MarkdownFile::NotFound) { Post.find("missing") }
  end

  test "raises NotFound for paths outside the content folder" do
    [ "../projects/sample-project", "../../config/site", "/etc/passwd", "posts/older-post" ].each do |slug|
      assert_raises(MarkdownFile::NotFound) { Post.find(slug) }
    end
  end

  test "rejects a file without front matter" do
    error = assert_raises(MarkdownFile::Invalid) { build_post("# Just Markdown") }
    assert_match "front matter is missing", error.message
  end

  test "rejects front matter that is never closed" do
    assert_raises(MarkdownFile::Invalid) { build_post("---\ntitle: X\ndate: 2026-01-01\n") }
  end

  test "rejects a missing title or date" do
    assert_raises(MarkdownFile::Invalid) { build_post("---\ndate: 2026-01-01\n---\nbody") }
    assert_raises(MarkdownFile::Invalid) { build_post("---\ntitle: X\n---\nbody") }
    assert_raises(MarkdownFile::Invalid) { build_post("---\ntitle: X\ndate: yesterday\n---\nbody") }
  end

  test "loads YAML safely, refusing Ruby objects" do
    error = assert_raises(MarkdownFile::Invalid) do
      build_post("---\ntitle: !ruby/object:OpenStruct {}\ndate: 2026-01-01\n---\nbody")
    end
    assert_match "invalid YAML", error.message
  end

  test "every file in content/ is valid" do
    Dir[Rails.root.join("content/{posts,projects,papers}/*.md")].each do |path|
      assert_nothing_raised { MarkdownFile.from_file(path) }
    end
  end
end
