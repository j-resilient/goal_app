# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  author_id        :integer          not null
#  commentable_id   :integer          not null
#  commentable_type :string           not null
#  comment_text     :text             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Comment < ApplicationRecord
    validates :author_id, :commentable_id, :commentable_type, :comment_text, presence: true

    belongs_to :commentable, polymorphic: true
end
