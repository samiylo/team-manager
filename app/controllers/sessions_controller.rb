class SessionsController < ApplicationController

    def new
        if logged_in
            redirect_to projects_path
        else
            @user = User.new 
        end
    end

    def create
        if auth_hash
            @user =  User.find_or_create_by(auth_hash['uid']) do |u|
                u.name = auth_hash['info']['name']
                u.id = auth_hash['extra']['raw_info']['id']
            end

            session[:user_id] = @user.id
            redirect_to projects_path
        else
            @user = User.find_by(email: params[:user][:email])

            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to projects_path
            else
                redirect_to new_session_path
            end
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_url
    end

    private

    def auth_hash
        request.env['omniauth.auth']
    end
end