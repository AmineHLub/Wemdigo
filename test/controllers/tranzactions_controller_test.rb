require 'test_helper'

class TranzactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tranzaction = tranzactions(:one)
  end

  test 'should get index' do
    get tranzactions_url
    assert_response :success
  end

  test 'should get new' do
    get new_tranzaction_url
    assert_response :success
  end

  test 'should create tranzaction' do
    assert_difference('Tranzaction.count') do
      post tranzactions_url,
           params: { tranzaction: { amount: @tranzaction.amount,

                                    category_id: @tranzaction.category_id,
                                    name: @tranzaction.name, splash_id: @tranzaction.splash_id } }
    end

    assert_redirected_to tranzaction_url(Tranzaction.last)
  end

  test 'should show tranzaction' do
    get tranzaction_url(@tranzaction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_tranzaction_url(@tranzaction)
    assert_response :success
  end

  test 'should update tranzaction' do
    patch tranzaction_url(@tranzaction),
          params: { tranzaction:
            { amount: @tranzaction.amount, category_id: @tranzaction.category_id, name: @tranzaction.name,
              splash_id: @tranzaction.splash_id } }
    assert_redirected_to tranzaction_url(@tranzaction)
  end

  test 'should destroy tranzaction' do
    assert_difference('Tranzaction.count', -1) do
      delete tranzaction_url(@tranzaction)
    end

    assert_redirected_to tranzactions_url
  end
end
