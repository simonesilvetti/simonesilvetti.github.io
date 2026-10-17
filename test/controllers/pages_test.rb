require "test_helper"

class PagesTest < ActionDispatch::IntegrationTest
  test "home shows the introduction, recent posts, papers and projects" do
    get root_path

    assert_response :success
    assert_select "h1", Rails.configuration.x.site.greeting
    assert_select "h2", "Recent Posts"
    assert_select "h2", "Recent Papers"
    assert_select "h2", "Selected Projects"
    assert_select "a[href=?]", paper_path("sample-paper")
    assert_select "a[href=?]", post_path("newer-post")
    assert_select "a[href=?]", project_path("sample-project")
  end

  test "about" do
    get about_path

    assert_response :success
    assert_select "h1", "About"
    assert_select ".prose h2", "Background"
    assert_select ".prose strong", "about"
    assert_select "nav a[aria-current=page]", "About"
  end

  test "research" do
    get research_path

    assert_response :success
    assert_select "h1", "Research"
    assert_select ".prose h2", "Topics"
    assert_select "nav a[aria-current=page]", "Research"
    assert_select "meta[name=description][content=?]", "What I work on"
  end

  test "the email address never appears in the HTML" do
    email = Rails.configuration.x.site.email
    get root_path

    assert_not_includes response.body, email
    assert_select "a[href^=mailto]", count: 0
    assert_select "a[data-email-user=?][data-email-domain=?]", email.split("@").first.reverse, email.split("@").last.reverse
  end

  test "every page has the theme toggle and a description" do
    get root_path

    assert_select "button[aria-label=?]", "Toggle dark mode"
    assert_select "meta[name=description][content=?]", Rails.configuration.x.site.description
  end
end
