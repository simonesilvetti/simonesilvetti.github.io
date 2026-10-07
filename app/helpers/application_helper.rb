module ApplicationHelper
  # Personal data from config/site.yml, e.g. site.name
  def site
    Rails.configuration.x.site
  end

  def page_title
    content_for?(:title) ? "#{content_for(:title)} | #{site.name}" : site.name
  end

  def page_description
    content_for?(:description) ? content_for(:description) : site.description
  end

  # 7 Oct, 2026
  def format_date(date)
    date.strftime("%-d %b, %Y")
  end

  # Header link, underlined while you are on that section.
  def nav_link_to(name, path)
    active = request.path == path || request.path.start_with?("#{path}/")

    link_to name, path,
      class: [ "px-2 py-1 font-medium hover:text-accent", ("underline decoration-wavy decoration-2 underline-offset-4" if active) ],
      aria: { current: ("page" if active) }
  end
end
