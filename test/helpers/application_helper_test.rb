require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  test "full title helper" do
    assert_equal full_title,         "Team Awesome Games"
    assert_equal full_title("Test"), "Test | Team Awesome Games"
  end
end
