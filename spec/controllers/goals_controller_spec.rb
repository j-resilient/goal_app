require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
    let(:user) { create(:user) }

    describe 'GET #new' do
        context 'when logged in' do
            before do
                allow(controller).to receive(:current_user) { user }
            end
            it 'renders the new goal template' do
                get :new, {}
                expect(response).to render_template('new')
                expect(response).to have_http_status(200)
            end
        end
    end

    describe 'POST #create' do
        before(:each) do
            allow(controller).to receive(:current_user) { user }
        end

        context 'with valid params' do
            it 'redirects to show page' do
                post :create, params: { goal: { title: "new goal"} }
                expect(response).to redirect_to(goal_url(Goal.last))
            end
        end

        context 'with invalid params' do
            it 'validates that the title is at least 6 characters long' do
                post :create, params: { goal: { title: "a" } }
                expect(flash[:errors]).to be_present
                expect(response).to render_template(:new)
            end
        end
    end

    describe 'POST #update'

    describe 'DELETE #destroy'
end