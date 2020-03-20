require 'test_helper'

class RiotAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get riot_accounts_index_url
    assert_response :success
  end

  test "should get show" do
    get riot_accounts_show_url
    assert_response :success
  end

  test "should get new" do
    get riot_accounts_new_url
    assert_response :success
  end

  test "should get create" do
    get riot_accounts_create_url
    assert_response :success
  end

  test "should get update" do
    get riot_accounts_update_url
    assert_response :success
  end

  test "should get edit" do
    get riot_accounts_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get riot_accounts_destroy_url
    assert_response :success
  end

end
