require 'test_helper'

class ShelvesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shelf = shelves(:one)
  end

  test "should get index" do
    get shelves_url, as: :json
    assert_response :success
  end

  test "should create shelf" do
    assert_difference('Shelf.count') do
      post shelves_url, params: { shelf: { floo: @shelf.floo, hall: @shelf.hall, shelving: @shelf.shelving, warehouse_id: @shelf.warehouse_id } }, as: :json
    end

    assert_response 201
  end

  test "should show shelf" do
    get shelf_url(@shelf), as: :json
    assert_response :success
  end

  test "should update shelf" do
    patch shelf_url(@shelf), params: { shelf: { floo: @shelf.floo, hall: @shelf.hall, shelving: @shelf.shelving, warehouse_id: @shelf.warehouse_id } }, as: :json
    assert_response 200
  end

  test "should destroy shelf" do
    assert_difference('Shelf.count', -1) do
      delete shelf_url(@shelf), as: :json
    end

    assert_response 204
  end
end
