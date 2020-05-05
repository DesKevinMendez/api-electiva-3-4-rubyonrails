require 'test_helper'

class DeparturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @departure = departures(:one)
  end

  test "should get index" do
    get departures_url, as: :json
    assert_response :success
  end

  test "should create departure" do
    assert_difference('Departure.count') do
      post departures_url, params: { departure: { date: @departure.date, destination_warehouse_id: @departure.destination_warehouse_id, id_document: @departure.id_document, total: @departure.total, user_id: @departure.user_id, warehouse_id: @departure.warehouse_id } }, as: :json
    end

    assert_response 201
  end

  test "should show departure" do
    get departure_url(@departure), as: :json
    assert_response :success
  end

  test "should update departure" do
    patch departure_url(@departure), params: { departure: { date: @departure.date, destination_warehouse_id: @departure.destination_warehouse_id, id_document: @departure.id_document, total: @departure.total, user_id: @departure.user_id, warehouse_id: @departure.warehouse_id } }, as: :json
    assert_response 200
  end

  test "should destroy departure" do
    assert_difference('Departure.count', -1) do
      delete departure_url(@departure), as: :json
    end

    assert_response 204
  end
end
