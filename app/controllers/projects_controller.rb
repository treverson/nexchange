class ProjectsController < ApplicationController

  def index
    @user = current_user
    @projects = Project.all
    @users = User.all
    @groups = Group.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @parent = parent
  end
  
  def create
    @parent = parent
    @project = @parent.projects.new(project_params)
    @project.save
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
  end

  def delete
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private
    def parent
      User.find params[:user_id] if params[:user_id]
      Group.find params[:group_id] if params[:group_id]
    end

    def project_params
      params.require(:project).permit(:title, :description)
    end
end
