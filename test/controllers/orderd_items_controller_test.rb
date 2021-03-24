require 'test_helper'

class OrderdItemsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orderd_items_index_url
    assert_response :success
  end

  test "should get show" do
    get orderd_items_show_url
    assert_response :success
  end

end
