require "test_helper"

class PaperTest < ActiveSupport::TestCase
  test "reads papers from their own folder" do
    paper = Paper.find("sample-paper")

    assert_equal "Sample paper", paper.title
    assert_equal [ "Ada Lovelace", "Simone Silvetti" ], paper.authors
    assert_equal "Sample Conference (SC)", paper.venue
    assert_equal "1–10", paper.pages
    assert_equal "https://doi.org/10.1234/sample", paper.url
    assert_equal "https://arxiv.org/abs/1234.56789", paper.preprint
  end

  test "ignores a url that is not https" do
    paper = Paper.new(slug: "x", text: "---\ntitle: X\ndate: 2026-01-01\nurl: \"javascript:alert(1)\"\n---\n")

    assert_nil paper.url
  end

  test "ignores a preprint that is not https" do
    paper = Paper.new(slug: "x", text: "---\ntitle: X\ndate: 2026-01-01\npreprint: \"http://arxiv.org/abs/1\"\n---\n")

    assert_nil paper.preprint
  end
end
