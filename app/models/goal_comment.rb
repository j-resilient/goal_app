# == Schema Information
#
# Table name: goal_comments
#
#  id         :bigint           not null, primary key
#  author_id  :integer          not null
#  goal_id    :integer          not null
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class GoalComment < ApplicationRecord
    validates :author_id, :goal_id, :comment, presence: true

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User

    belongs_to :goal,
        primary_key: :id,
        foreign_key: :goal_id,
        class_name: :Goal
end
