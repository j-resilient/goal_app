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

    describe '#set_private_and_completed' do
        subject(:user) { create(:user) }

        it 'sets unset private and completed attributes to false' do
            goal = Goal.new(user_id: user.id, title: "test")
            expect(goal.private).to be false
            expect(goal.completed).to be false
        end
        
        it 'does not reset attributes if already set' do
            goal = Goal.new(
                user_id: user.id, 
                title: "test", 
                completed: true, 
                private: true
                )
            expect(goal.private).to be true    
            expect(goal.completed).to be true    
        end
    end
end