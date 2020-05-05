require 'test_helper'

class DepartureDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @departure_detail = departure_details(:one)
  end

  test "should get index" do
    get departure_details_url, as: :json
    assert_response :success
  end

  test "should create departure_detail" do
    assert_difference('DepartureDetail.count') do
      post departure_details_url, params: { departure_detail: { departure_id: @departure_detail.departure_id, price: @departure_detail.price, product_id: @departure_detail.product_id, quantity: @departure_detail.quantity, subtotal: @departure_detail.subtotal } }, as: :json
    end

    assert_response 201
  end

  test "should show departure_detail" do
    get departure_detail_url(@departure_detail), as: :json
    assert_response :success
  end

  test "should update departure_detail" do
    patch departure_detail_url(@departure_detail), params: { departure_detail: { departure_id: @departure_detail.departure_id, price: @departure_detail.price, product_id: @departure_detail.product_id, quantity: @departure_detail.quantity, subtotal: @departure_detail.subtotal } }, as: :json
    assert_response 200
  end

  test "should destroy departure_detail" do
    assert_difference('DepartureDetail.count', -1) do
      delete departure_detail_url(@departure_detail), as: :json
    end

    assert_response 204
  end
end
