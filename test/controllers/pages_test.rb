require "test_helper"

class PagesTest < ActionDispatch::IntegrationTest
  test "home shows the introduction, recent posts and projects" do
    get root_path

    assert_response :success
    assert_select "h1", Rails.configuration.x.site.greeting
    assert_select "h2", "Recent Posts"
    assert_select "h2", "Selected Projects"
    assert_select "a[href=?]", post_path("newer-post")
    assert_select "a[href=?]", project_path("sample-project")
  end

  test "about" do
    get about_path

    assert_response :success
    assert_select "h1", "About"
    assert_select "nav a[aria-current=page]", "About"
  end

  test "every page has the theme toggle and a description" do
    get root_path

    assert_select "button[aria-label=?]", "Toggle dark mode"
    assert_select "meta[name=description][content=?]", Rails.configuration.x.site.description
  end
end
