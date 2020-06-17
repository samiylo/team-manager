class ProjectsController < ApplicationController
    before_action :require_login
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index

    end

    def show

    end

    def new

    end
    
    def create

    end

    def edit

    end

    def update

        if @project.update(project_params)
            redirect_to projects_path
        else
            render :edit
        end
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

    private

    def set_project
        @project = Project.find(params[:id])
    end

    def project_params
        params.require('project').permit(:name)
    end

    def require_login
        return head(:forbidden) unless session.include? :user_id
    end
end
