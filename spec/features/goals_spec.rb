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

    scenario 'with invalid parameters' do
        visit new_goal_url
        click_button 'New Goal'
        expect(page).to have_content 'Title can\'t be blank'
    end
end

feature 'updating goals' do
    let(:user) { User.create!(username: "username", password: "password") }
    subject(:goal) { Goal.create!(title: "test goal", user_id: user.id) }

    scenario 'goal is completed' do
        visit edit_goal_url(goal)
        choose('Completed')
        click_button 'Update Goal'
        expect(page).to have_content 'Goal successfully edited!'
    end
end

feature 'destroying goals'