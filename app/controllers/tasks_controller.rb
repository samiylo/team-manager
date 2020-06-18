class TasksController < ApplicationController
    before_action :require_login
    before_action :set_task, only: [:edit, :update, :destroy, :complete]

    def index

        if params[:user_id]
            if User.find(params[:user_id]) == current_user
                @user = User.find(params[:user_id])
                @tasks = @user.tasks
            else
                redirect_to projects_path
                flash[:notice] = "Unauthorized Access."
            end
        else
            @tasks = Task.all
        end
    end
    
    def new
        if params[:user_id]
            @user = User.find(params[:user_id])
            @task = Task.new(user_id: @user.id)
    
        else
            @user = nil
            @task = Task.new
        end
    
    
    end
    
    def create
    
        @task = Task.new(task_params)
    
        if @task.save
            redirect_to projects_path
        else
            render :new
        end
    end
    
    def edit
        # binding.pry 
        # @task = Task.find(params[:id])
        if current_user.id == @task.user_id
        else 
            redirect_to projects_path
        end
    end
    
    def update
    
        if @task.update(task_params)
    
            redirect_to projects_path
        else
            render :edit
        end
    
    end
    
    def complete
        @task.update(completed: true)
        redirect_to projects_path
    end
    
    def destroy
        if current_user.id == @task.user_id
            @task.destroy
            redirect_to projects_path
        else
            redirect_to projects_path
        end

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
