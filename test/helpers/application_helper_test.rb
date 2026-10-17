require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "the email is split and reversed" do
    assert_equal({ email_user: "ecila", email_domain: "moc.elpmaxe" }, email_link_data("alice@example.com"))
  end
end
