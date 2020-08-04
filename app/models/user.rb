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
class User < ApplicationRecord
    attr_reader :password
    after_initialize :set_session_token

    validates :username, :password_digest, :session_token, presence: true
    validates :username, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }

    has_many :goals, dependent: :destroy

    # comments the user has written on goals
    has_many :authored_goal_comments,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :GoalComment

    # comments the user has written on other people's user pages
    has_many :authored_user_comments,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :UserComment

    # comments the user has received on their user page
    has_many :comments,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :UserComment,
        dependent: :destroy

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def self.generate_session_token
        SecureRandom::urlsafe_base64(16)
    end

    def reset_session_token!
        token = self.class.generate_session_token
        self.session_token = token
        self.save!
        token
    end

    def set_session_token
        self.session_token ||= self.class.generate_session_token
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end
end
