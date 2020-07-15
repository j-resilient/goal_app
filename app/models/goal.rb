# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  title      :string           not null
#  details    :text
#  private    :boolean          default(FALSE)
#  completed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Goal < ApplicationRecord
    after_initialize :set_private_and_completed

    validates :user_id, :title, presence: true
    validates :title, length: { minimum: 6 }
    validates :private, :completed, inclusion: { in: [true, false] }

    def set_private_and_completed
        self.private = false
        self.completed = false
    end

    belongs_to :user
end
