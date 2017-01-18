class ProjectsController < ApplicationController
  before_action :find_projectable

  def index
    @projects = Project.all
    @user = current_user
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @projectable = find_projectable
    @project = @projectable.projects.new

  end

  def create
    @projectable = find_projectable
    @project = @projectable.projects.new(project_params)
    # @project.creator << current_user

    if @project.save
      redirect_to @project.projectable
    else
      render :new
    end

  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project.projectable
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to @project.projectable

  end

  private
    def find_projectable
      if params[:group_id]
        @projectable = Group.find(params[:group_id])
      elsif params[:user_id]
        @projectable = User.find(params[:user_id])
      end
    end

    def project_params
      params.require(:project).permit(:title, :description)
    end

end
