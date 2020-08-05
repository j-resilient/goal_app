class GoalCommentsController < ApplicationController
    def create
        comment = Comment.create(
            author_id: current_user.id, 
            commentable_type: "Goal",
            commentable_id: params[:goal_id], 
            comment_text: params[:comment])

        flash.now[:errors] = comment.errors.full_messages
        redirect_to goal_url(params[:goal_id])
    end
end