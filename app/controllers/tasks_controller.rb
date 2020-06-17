class TasksController < ApplicationController
    before_action :require_login
    before_action :set_task, only: [:edit, :update, :destroy, :complete]

    def index

    end

    def create

    end

    def edit
        
    end
end
