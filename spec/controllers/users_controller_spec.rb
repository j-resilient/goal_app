require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe 'GET #new' do
        it 'renders the new user template' do
            get :new, {}
            expect(response).to render_template('new')
            expect(response).to have_http_status(200)
        end
    end

    describe 'POST #create' do
        context 'with valid params' do
            it 'redirects to show page' do
                post :create, params: { user: { username: "z", password: "password" } }
                expect(response).to redirect_to(user_url(User.last))
            end
        end

        context 'with invalid params' do
            it 'validates the user\'s credentials' do
                post :create, params: { user: { username: 'a' } }
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end

            it 'validates that the password is at least 6 characters' do
                post :create, params: { user: { username: "a", password: "pass" } }
                expect(flash[:errors]).to be_present
                expect(response).to render_template(:new)
            end
        end
    end
end