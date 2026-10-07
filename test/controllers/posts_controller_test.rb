require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "index lists every post" do
    get posts_path

    assert_response :success
    assert_select "li h2", 2
  end

  test "show renders the post" do
    get post_path("newer-post")

    assert_response :success
    assert_select "title", /Newer post/
    assert_select "meta[name=description][content=?]", "Written second"
    assert_select "h1", "Newer post"
    assert_select "time[datetime=?]", "2026-02-01"
    assert_select "article strong", "bold"
    assert_select "article script", 0
  end

  test "a missing post is a 404" do
    get post_path("missing")

    assert_response :not_found
  end

  test "path traversal is a 404" do
    get "/posts/..%2F..%2Fconfig%2Fsite"

    assert_response :not_found
  end
end
