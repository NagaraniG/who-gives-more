require 'test_helper'

class AccountInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get account_informations_index_url
    assert_response :success
  end

  test "should get edit" do
    get account_informations_edit_url
    assert_response :success
  end

  test "should get new" do
    get account_informations_new_url
    assert_response :success
  end

  test "should get show" do
    get account_informations_show_url
    assert_response :success
  end

end
