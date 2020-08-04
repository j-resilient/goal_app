class UserCommentsController < ApplicationController
    def create
        comment = UserComment.create(
            author_id: current_user.id,
            user_id: params[:user_id],
            comment: params[:comment]
        )
        flash.now[:errors] = comment.errors.full_messages
        redirect_to user_url(params[:user_id])
    end
end