# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest).with_message("Password cannot be blank.") }
    it { should validate_presence_of(:session_token) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe '::find_by_credentials' do
    context 'where user exists' do
      it 'returns the correct user object' do
        test = User.find_by_credentials(user.username, user.password)
        expect(test.id).to eq(user.id)
        expect(test).to be_an_instance_of(User)
      end
    end

    context 'where user doesn\'t exist' do
      it 'returns nil' do
        expect(User.find_by_credentials('nil', 'nil')).to be_nil
      end
    end
  end

  describe "password encryption" do
    it "does not save passwords to the database" do
      test = User.find_by(username: user.username)
      expect(test.password).not_to be(user.password)
    end

    it "encrypts the passwords using BCrypt" do
      expect(BCrypt::Password).to receive(:create)
      User.new(username: "username2", password: "password")
    end

  end

end
