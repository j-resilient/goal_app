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

    describe 'POST #create'

    describe 'POST #update'

    describe 'DELETE #destroy'
end