require 'application_system_test_case'

class TransTest < ApplicationSystemTestCase
  setup do
    @tran = trans(:one)
  end

  test 'visiting the index' do
    visit trans_url
    assert_selector 'h1', text: 'Trans'
  end

  test 'should create tran' do
    visit trans_url
    click_on 'New tran'

    fill_in 'Amount', with: @tran.amount
    fill_in 'Name', with: @tran.name
    click_on 'Create Tran'

    assert_text 'Tran was successfully created'
    click_on 'Back'
  end

  test 'should update Tran' do
    visit tran_url(@tran)
    click_on 'Edit this tran', match: :first

    fill_in 'Amount', with: @tran.amount
    fill_in 'Name', with: @tran.name
    click_on 'Update Tran'

    assert_text 'Tran was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Tran' do
    visit tran_url(@tran)
    click_on 'Destroy this tran', match: :first

    assert_text 'Tran was successfully destroyed'
  end
end
