require 'rails_helper'

RSpec.describe Goal, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:user_id) }
        it { should validate_presence_of(:title) }
        it { should validate_length_of(:title).is_at_least(6) }
    end

    describe 'associations' do
        it { should have_many(:comments) }
        it { should belong_to(:user) }
    end
end