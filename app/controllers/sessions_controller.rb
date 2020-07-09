class SessionsController < ApplicationController
    def new
        render :show
    end

    def create
        # validate credentials
        # set session token
    end

    def destroy
        # log user out
        # reset session token
    end
end