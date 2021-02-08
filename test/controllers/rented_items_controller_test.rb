require 'test_helper'

class RentedItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rented_item = rented_items(:one)
  end

  test "should get index" do
    get rented_items_url
    assert_response :success
  end

  test "should get new" do
    get new_rented_item_url
    assert_response :success
  end

  test "should create rented_item" do
    assert_difference('RentedItem.count') do
      post rented_items_url, params: { rented_item: {  } }
    end

    assert_redirected_to rented_item_url(RentedItem.last)
  end

  test "should show rented_item" do
    get rented_item_url(@rented_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_rented_item_url(@rented_item)
    assert_response :success
  end

  test "should update rented_item" do
    patch rented_item_url(@rented_item), params: { rented_item: {  } }
    assert_redirected_to rented_item_url(@rented_item)
  end

  test "should destroy rented_item" do
    assert_difference('RentedItem.count', -1) do
      delete rented_item_url(@rented_item)
    end

    assert_redirected_to rented_items_url
  end
end
