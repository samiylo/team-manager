class StaticController < ApplicationController
    layout 'sessions'
    
    def welcome
        if logged_in
            redirect_to projects_path
            flash[:notice] = "User already logged in"
        end
    end
end