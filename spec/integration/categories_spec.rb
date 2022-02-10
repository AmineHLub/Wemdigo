require 'rails_helper'

RSpec.feature 'Category #Index', type: :feature do
  describe 'Login Page requirements' do
    background do
      @user = User.create!(name: 'test', email: 'testwithout@ss.com', password: '123456', confirmed_at: Time.now)
      @user_cat = Category.create(name: 'Starbucks', total: 0, user_id: @user.id)
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Login'
      visit categories_path
    end

    it 'sees starbucks name' do
      expect(page).to have_content('Starbucks')
    end

    it 'sees intial expences' do
      expect(page).to have_content('0.0 $')
    end

    it 'sees add category button' do
      expect(page).to have_content('New category')
    end
  end

  # Any test will fail bc of new google webdriver 98. can't use fill_in "@"
end
