require 'test_helper'

class EntriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get entries_url, as: :json
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entrie.count') do
      post entries_url, params: { entry: { date: @entry.date, id_document: @entry.id_document, origin_warehouse_id: @entry.origin_warehouse_id, total: @entry.total, user_id: @entry.user_id, warehouse_id: @entry.warehouse_id } }, as: :json
    end

    assert_response 201
  end

  test "should show entry" do
    get entry_url(@entry), as: :json
    assert_response :success
  end

  test "should update entry" do
    patch entry_url(@entry), params: { entry: { date: @entry.date, id_document: @entry.id_document, origin_warehouse_id: @entry.origin_warehouse_id, total: @entry.total, user_id: @entry.user_id, warehouse_id: @entry.warehouse_id } }, as: :json
    assert_response 200
  end

  test "should destroy entry" do
    assert_difference('Entrie.count', -1) do
      delete entry_url(@entry), as: :json
    end

    assert_response 204
  end
end
