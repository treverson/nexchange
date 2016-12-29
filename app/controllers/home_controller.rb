class HomeController < ApplicationController
  def index
    @projects = Project.all
    @users = User.all
    @groups = Group.all
  end
end
