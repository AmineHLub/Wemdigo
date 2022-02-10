require 'rails_helper'

RSpec.describe 'Login page', js: true, type: :feature do
  describe 'Login Page requirements' do
    it 'has username and password inputs, and Log in button' do
      visit new_user_session_path
      expect(page).to have_field('user_email')
      expect(page).to have_field('user_password')
      expect(page).to have_button('Login')
    end
  end

  # Any test will fail bc of new google webdriver 98. can't use fill_in "@"
end
