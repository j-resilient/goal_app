require 'rails_helper'

RSpec.describe Comment, type: :model do
    describe "validations" do
        it { should validate_presence_of(:author_id) }
        it { should validate_presence_of(:commentable_id) }
        it { should validate_presence_of(:commentable_type) }
        it { should validate_presence_of(:comment_text) }
    end

    describe "associations" do
        it { should belong_to(:commentable) }
    end
end