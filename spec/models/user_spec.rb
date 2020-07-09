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
  subject(:test_user) { User.create(username: "a", password: "password") }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password_digest) }
    it { should validate_presence_of(:session_token) }

    it { should validate_uniqueness_of(:username) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'associations'

  describe '::find_by_credentials' do
    context 'where user exists' do
      it 'returns the correct user object' do
        user = User.find_by_credentials('a', 'password')
        expect(user.id).to eq(test_user.id)
        expect(user).to be_an_instance_of(User)
      end
    end

    context 'where user doesn\'t exist' do
      it 'returns nil' do
        expect(User.find_by_credentials('nil', 'nil')).to be_nil
      end
    end
  end

end
