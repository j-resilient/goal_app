require 'rails_helper'

feature 'user comments' do
    let(:user) { User.create!(username: 'a', password: 'password') }

    before(:each) do
        visit new_session_url
        fill_in 'username', with: user.username
        fill_in 'password', with: user.password
        click_button 'Log In'
    end

    scenario 'create a comment' do
        visit user_url(user)
        fill_in "comment", with: "this is a test comment"
        click_button "Save Comment"
        expect(page).to have_content "this is a test comment"
    end
end