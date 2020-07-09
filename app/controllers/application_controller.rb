class ApplicationController < ActionController::Base
    helper_method :current_user, :login!, :logout
    
    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        @current_user = user
        session[:session_token] = user.session_token
    end

    def logout!
        return nil if @current_user.nil?
        @current_user.reset_session_token!
        @current_user = nil
        session[:session_token] = nil
    end
end
