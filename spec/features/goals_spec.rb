require 'rails_helper'

feature 'creating goals' do
    before(:each) do
        visit new_user_url
        fill_in 'username', with: 'username'
        fill_in 'password', with: 'password'
        click_button 'Sign Up'
    end

    scenario 'with valid parameters' do
        visit new_goal_url
        fill_in 'Title', with: 'new goal'
        click_button 'New Goal'
        expect(page).to have_content 'Goal saved!'
    end

    feature 'with invalid parameters'
end

feature 'updating goals'

feature 'destroying goals'