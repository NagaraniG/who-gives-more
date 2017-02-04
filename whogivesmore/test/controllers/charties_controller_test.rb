require 'test_helper'

class ChartiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get charties_index_url
    assert_response :success
  end

  test "should get show" do
    get charties_show_url
    assert_response :success
  end

  test "should get new" do
    get charties_new_url
    assert_response :success
  end

  test "should get edit" do
    get charties_edit_url
    assert_response :success
  end

end
