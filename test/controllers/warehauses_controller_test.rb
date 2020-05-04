require 'test_helper'

class WarehousesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehouse = warehouses(:one)
  end

  test "should get index" do
    get warehouses_url, as: :json
    assert_response :success
  end

  test "should create warehouse" do
    assert_difference('warehouse.count') do
      post warehouses_url, params: { warehouse: { address: @warehouse.address, name: @warehouse.name, phone: @warehouse.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show warehouse" do
    get warehouse_url(@warehouse), as: :json
    assert_response :success
  end

  test "should update warehouse" do
    patch warehouse_url(@warehouse), params: { warehouse: { address: @warehouse.address, name: @warehouse.name, phone: @warehouse.phone } }, as: :json
    assert_response 200
  end

  test "should destroy warehouse" do
    assert_difference('warehouse.count', -1) do
      delete warehouse_url(@warehouse), as: :json
    end

    assert_response 204
  end
end
