require 'test_helper'

class MainsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mains_index_url
    assert_response :success
  end

  test "should get show" do
    get mains_show_url
    assert_response :success
  end

end
