class ApplicationController < ActionController::Base
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in
        !!session[:user_id]
    end

    def authorized
        current_user.id == @task.user_id || current_user.admin 
    end

    helper_method :current_user, :logged_in, :authorized
end
