require 'application_system_test_case'

class TranzactionsTest < ApplicationSystemTestCase
  setup do
    @tranzaction = tranzactions(:one)
  end

  test 'visiting the index' do
    visit tranzactions_url
    assert_selector 'h1', text: 'Tranzactions'
  end

  test 'should create tranzaction' do
    visit tranzactions_url
    click_on 'New tranzaction'

    fill_in 'Amount', with: @tranzaction.amount
    fill_in 'Category', with: @tranzaction.category_id
    fill_in 'Name', with: @tranzaction.name
    fill_in 'Splash', with: @tranzaction.splash_id
    click_on 'Create Tranzaction'

    assert_text 'Tranzaction was successfully created'
    click_on 'Back'
  end

  test 'should update Tranzaction' do
    visit tranzaction_url(@tranzaction)
    click_on 'Edit this tranzaction', match: :first

    fill_in 'Amount', with: @tranzaction.amount
    fill_in 'Category', with: @tranzaction.category_id
    fill_in 'Name', with: @tranzaction.name
    fill_in 'Splash', with: @tranzaction.splash_id
    click_on 'Update Tranzaction'

    assert_text 'Tranzaction was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Tranzaction' do
    visit tranzaction_url(@tranzaction)
    click_on 'Destroy this tranzaction', match: :first

    assert_text 'Tranzaction was successfully destroyed'
  end
end
