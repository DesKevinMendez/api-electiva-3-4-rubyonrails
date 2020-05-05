require 'test_helper'

class EntryDetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entry_detail = entry_details(:one)
  end

  test "should get index" do
    get entry_details_url, as: :json
    assert_response :success
  end

  test "should create entry_detail" do
    assert_difference('EntryDetail.count') do
      post entry_details_url, params: { entry_detail: { entrie_id: @entry_detail.entrie_id, price: @entry_detail.price, product_id: @entry_detail.product_id, quantity: @entry_detail.quantity, subtotal: @entry_detail.subtotal } }, as: :json
    end

    assert_response 201
  end

  test "should show entry_detail" do
    get entry_detail_url(@entry_detail), as: :json
    assert_response :success
  end

  test "should update entry_detail" do
    patch entry_detail_url(@entry_detail), params: { entry_detail: { entrie_id: @entry_detail.entrie_id, price: @entry_detail.price, product_id: @entry_detail.product_id, quantity: @entry_detail.quantity, subtotal: @entry_detail.subtotal } }, as: :json
    assert_response 200
  end

  test "should destroy entry_detail" do
    assert_difference('EntryDetail.count', -1) do
      delete entry_detail_url(@entry_detail), as: :json
    end

    assert_response 204
  end
end
