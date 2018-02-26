require 'test_helper'

class StatisPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get statis_pages_home_url
    assert_response :success
  end

  test "should get help" do
    get statis_pages_help_url
    assert_response :success
  end

end
