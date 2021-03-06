class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(
            session_params[:username],
            session_params[:password]
        )

        if user.nil?
            flash.now[:errors] = ["Incorrect credentials."]
            render :new
        else
            login!(user)
            redirect_to user_url(user)
        end
    end

    def destroy
        logout!
        redirect_to new_user_url
    end

    private
    def session_params
        params.require(:session).permit(:username, :password)
    end
end