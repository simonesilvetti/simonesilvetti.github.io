require "test_helper"

class PageTest < ActiveSupport::TestCase
  test "reads pages from their own folder" do
    page = Page.find("about")

    assert_equal "About", page.title
    assert_includes page.html, "<strong>about</strong>"
  end

  test "a page needs no date" do
    page = Page.new(slug: "x", text: "---\ntitle: X\n---\nText")

    assert_nil page.date
  end
end
