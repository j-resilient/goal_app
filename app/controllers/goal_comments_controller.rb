class GoalCommentsController < ApplicationController
    def create
        comment = GoalComment.create(
            author_id: current_user.id, 
            goal_id: params[:goal_id], 
            comment: params[:comment])

        flash.now[:errors] = comment.errors.full_messages
        redirect_to goal_url(params[:goal_id])
    end
end