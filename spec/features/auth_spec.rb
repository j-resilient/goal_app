require 'rails_helper'


feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up!"
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'username'
      fill_in 'password', with: 'password'
      click_button 'Sign Up'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'username'
    end

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end