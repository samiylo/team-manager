class SessionsController < ApplicationController

    


    private

    def auth_hash
        request.env['omniauth.uth']
    end
end