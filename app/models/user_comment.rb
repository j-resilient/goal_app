# == Schema Information
#
# Table name: user_comments
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  author_id  :integer          not null
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserComment < ApplicationRecord
    validates :user_id, :author_id, :comment, presence: true

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User
end
