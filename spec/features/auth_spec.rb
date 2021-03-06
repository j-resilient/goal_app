require 'rails_helper'

feature 'the signup process' do
  
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "Sign Up!"
  end
  
  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in "Username", with: "username"
      fill_in "Password", with: "password"
      click_button "Sign Up"
    end
    
    scenario 'shows username on the homepage after signup' do
      visit users_url
      expect(page).to have_content 'username'
    end
    
  end
end

feature 'logging in' do
  subject(:user) { User.create!(username: "username", password: "password") }
  
  before(:each) do
    visit new_session_url
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Log In'
  end

  scenario 'shows username on the homepage after login' do
    visit users_url
    expect(page).to have_content user.username
  end

end

feature 'logging out' do
  let(:user) { User.create!(username: 'alice', password: 'password') }

  scenario 'begins with a logged out state' do
    visit root_url
    expect(page).to have_content 'Log In'
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    visit users_url
    expect(page).to_not have_content "Welcome #{user.username}"
  end

end