class GoalCommentsController < ApplicationController
    def create
        comment = GoalComment.new(
            author_id: current_user.id, 
            goal_id: params[:id], 
            comment: params[:comment])

        unless comment.save
            flash.now[:errors] = comment.errors.full_messages
        end

        redirect_to goal_url(params[:id])

        # if comment.save
        #     redirect_to goal_url(params[:id])
        # else
        #     flash.now[:errors] = comment.errors.full_messages
        #     redirect_to goal_url(params[:id])
        # end
    end

    
end