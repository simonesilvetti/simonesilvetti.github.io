require "test_helper"

class PapersControllerTest < ActionDispatch::IntegrationTest
  test "index groups papers by year" do
    get papers_path

    assert_response :success
    assert_select "h2", "2024"
    assert_select "li h3", "Sample paper"
  end

  test "show renders the paper with your name in bold" do
    get paper_path("sample-paper")

    assert_response :success
    assert_select "h1", "Sample paper"
    assert_select "strong", Rails.configuration.x.site.name
    assert_select "a[href=?]", "https://doi.org/10.1234/sample"
    assert_select "article h2", "Details"
  end

  test "a missing paper is a 404" do
    get paper_path("missing")

    assert_response :not_found
  end
end
