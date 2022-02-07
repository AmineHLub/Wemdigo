require "test_helper"

class TransControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tran = trans(:one)
  end

  test "should get index" do
    get trans_url
    assert_response :success
  end

  test "should get new" do
    get new_tran_url
    assert_response :success
  end

  test "should create tran" do
    assert_difference("Tran.count") do
      post trans_url, params: { tran: { amount: @tran.amount, name: @tran.name } }
    end

    assert_redirected_to tran_url(Tran.last)
  end

  test "should show tran" do
    get tran_url(@tran)
    assert_response :success
  end

  test "should get edit" do
    get edit_tran_url(@tran)
    assert_response :success
  end

  test "should update tran" do
    patch tran_url(@tran), params: { tran: { amount: @tran.amount, name: @tran.name } }
    assert_redirected_to tran_url(@tran)
  end

  test "should destroy tran" do
    assert_difference("Tran.count", -1) do
      delete tran_url(@tran)
    end

    assert_redirected_to trans_url
  end
end
