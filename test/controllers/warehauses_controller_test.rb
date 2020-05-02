require 'test_helper'

class WarehausesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @warehause = warehauses(:one)
  end

  test "should get index" do
    get warehauses_url, as: :json
    assert_response :success
  end

  test "should create warehause" do
    assert_difference('Warehause.count') do
      post warehauses_url, params: { warehause: { address: @warehause.address, name: @warehause.name, phone: @warehause.phone } }, as: :json
    end

    assert_response 201
  end

  test "should show warehause" do
    get warehause_url(@warehause), as: :json
    assert_response :success
  end

  test "should update warehause" do
    patch warehause_url(@warehause), params: { warehause: { address: @warehause.address, name: @warehause.name, phone: @warehause.phone } }, as: :json
    assert_response 200
  end

  test "should destroy warehause" do
    assert_difference('Warehause.count', -1) do
      delete warehause_url(@warehause), as: :json
    end

    assert_response 204
  end
end
