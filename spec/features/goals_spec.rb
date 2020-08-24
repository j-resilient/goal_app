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
    before(:each) do
        visit new_user_url
        fill_in 'username', with: 'username'
        fill_in 'password', with: 'password'
        click_button 'Sign Up'
    end
    subject(:goal) { Goal.create!(title: "test goal", user_id: User.last.id) }

    scenario 'goal is completed' do
        visit edit_goal_url(goal)
        choose('Completed')
        click_button 'Update Goal'
        expect(page).to have_content 'Goal successfully edited!'
    end
end

feature 'destroying goals' do
    let(:user) { User.create!(username: "username", password: "password") }

    before(:each) do
        visit new_session_url
        fill_in "Username", with: user.username
        fill_in "Password", with: user.password
        click_button "Log In"
    end

    scenario 'delete goal' do
        goal = Goal.create!(title: "test goal", user_id: user.id)
        visit user_url(user)
        click_button "delete \'#{goal.title}\' goal"
        expect(page).to_not have_content goal.title
    end
end