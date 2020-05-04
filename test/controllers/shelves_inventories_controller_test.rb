require 'test_helper'

class ShelvesInventoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shelves_inventory = shelves_inventories(:one)
  end

  test "should get index" do
    get shelves_inventories_url, as: :json
    assert_response :success
  end

  test "should create shelves_inventory" do
    assert_difference('ShelvesInventorie.count') do
      post shelves_inventories_url, params: { shelves_inventory: { inventorie_id: @shelves_inventory.inventorie_id, quantity: @shelves_inventory.quantity, shelf_id: @shelves_inventory.shelf_id } }, as: :json
    end

    assert_response 201
  end

  test "should show shelves_inventory" do
    get shelves_inventory_url(@shelves_inventory), as: :json
    assert_response :success
  end

  test "should update shelves_inventory" do
    patch shelves_inventory_url(@shelves_inventory), params: { shelves_inventory: { inventorie_id: @shelves_inventory.inventorie_id, quantity: @shelves_inventory.quantity, shelf_id: @shelves_inventory.shelf_id } }, as: :json
    assert_response 200
  end

  test "should destroy shelves_inventory" do
    assert_difference('ShelvesInventorie.count', -1) do
      delete shelves_inventory_url(@shelves_inventory), as: :json
    end

    assert_response 204
  end
end
