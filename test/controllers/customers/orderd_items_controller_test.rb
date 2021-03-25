require 'test_helper'

class Customers::OrderdItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_orderd_items_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_orderd_items_show_url
    assert_response :success
  end

  test "should get finish" do
    get customers_orderd_items_finish_url
    assert_response :success
  end

  test "should get confirm" do
    get customers_orderd_items_confirm_url
    assert_response :success
  end

  test "should get create" do
    get customers_orderd_items_create_url
    assert_response :success
  end

end
