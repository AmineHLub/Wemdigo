require 'rails_helper'

RSpec.feature 'Tranzactions #Index', type: :feature do
  describe 'Login Page requirements' do
    background do
      @user = User.create!(name: 'test', email: 'testwithout@ss.com', password: '123456', confirmed_at: Time.now)
      @user_cat = Category.create(name: 'Starbucks', total: 0, user_id: @user.id)
      @user_tran = Tranzaction.create(name: 'Latte', amount: 5, user_id: @user.id)
      @join_tbl = CategoriesTranzaction.create(category: @user_cat, tranzaction: @user_tran)
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Login'
      visit category_path(@user_cat.id)
    end

    it 'sees starbucks name' do
      expect(page).to have_content('Starbucks')
    end

    it 'sees added expences' do
      expect(page).to have_content('5.0 $')
    end

    it 'sees add category button' do
      expect(page).to have_content('Add a new transaction')
    end
  end

  # Any test will fail bc of new google webdriver 98. can't use fill_in "@"
end
