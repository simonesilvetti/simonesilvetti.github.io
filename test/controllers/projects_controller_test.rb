require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  test "index lists every project" do
    get projects_path

    assert_response :success
    assert_select "li h2", "Sample project"
  end

  test "show renders the project" do
    get project_path("sample-project")

    assert_response :success
    assert_select "h1", "Sample project"
    assert_select "a[href=?]", "https://github.com/example/sample"
  end

  test "a missing project is a 404" do
    get project_path("missing")

    assert_response :not_found
  end
end
