class TasksController < ApplicationController
    before_action :require_login
    before_action :set_task, only: [:edit, :update, :destroy, :complete]

    def index

    end

    def create

    end

    def edit

    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:due_date, :description, :user_id, :project_id)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
