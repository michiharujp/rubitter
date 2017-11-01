require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Twitter on Rails"
    assert_equal full_title("Help"), "Help | Twitter on Rails"
  end
end
