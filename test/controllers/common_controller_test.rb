require 'test_helper'

class CommonControllerTest < ActionDispatch::IntegrationTest
  test "should get header" do
    get common_header_url
    assert_response :success
  end

  test "should get footer" do
    get common_footer_url
    assert_response :success
  end

end
