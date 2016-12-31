class ProjectsController < ApplicationController
before_action :load_projectable

  def index
    @projects = @projectable.projects
    @user = current_user
    @users = User.all
    @groups = Group.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = @projectable.projects.new
  end

  def create
    @project = @projectable.projects.new(project_params)
      if @project.save
        redirect_to [@projectable, :projects], notice: 'Project created'
      else
        render :new
      end
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

    def project_params
      params.require(:project).permit(:title, :description)
    end

    def load_projectable
      resource, id = request.path.split('/')[1,2]
      @projectable = resource.singularize.classify.constantize.find(id)
    end

end
