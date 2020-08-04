require 'rails_helper'

feature 'goal comments' do
    let(:user) { User.create!(username: 'a', password: 'password') }
    let(:goal) { Goal.create!(user_id: user.id, title: "testing testing") }

    before(:each) do
        visit new_session_url
        fill_in 'username', with: user.username
        fill_in 'password', with: user.password
        click_button 'Log In'
    end

    scenario 'create a comment' do
        visit goal_url(goal)
        fill_in "comment", with: "this is a test comment"
        click_button "Save Comment"
        expect(page).to have_content "this is a test comment"
    end
end