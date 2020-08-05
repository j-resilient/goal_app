class UserCommentsController < ApplicationController
    def create
        comment = Comment.create(
            author_id: current_user.id,
            commentable_type: "User",
            commentable_id: params[:user_id],
            comment_text: params[:comment]
        )
        flash.now[:errors] = comment.errors.full_messages
        redirect_to user_url(params[:user_id])
    end
end