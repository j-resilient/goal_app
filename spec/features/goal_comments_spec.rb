require 'rails_helper'

feature 'goal comments' do
    scenario 'create a comment' do
        user = User.create!(username: 'a', password: 'password')
        goal = Goal.create!(user_id: user.id, title: "testing testing")

        visit goal_url(goal)
        fill_in "comment", with: "this is a test comment"
        click_button "Save Comment"
        expect(page).to have_content "this is a test comment"
    end
end