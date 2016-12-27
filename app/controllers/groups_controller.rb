class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.users << current_user

    if @group.save
      redirect_to @group
    else
      flash.now[:alert] = "There was an error saving the group. Please try again."
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])

    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    redirect_to groups_path
  end

  def add_user
    @group = Group.find(params[:group_id])
    @group.users << current_user

    if @group.save
      flash.now[:alert] = "You've been successfully added to this group."
    else
      flash.now[:alert] = "There was an error adding you to the group. Please try again."
    end
  end

  def remove_user
    @group = Group.find(params[:group_id])
    @group.users.destroy(current_user)

    if @group.save
      flash.now[:alert] = "You've been successfully removed from this group."
    else
      flash.now[:alert] = "There was an error removing you from the group. Please try again."
    end
  end

  private

    def group_params
      params.require(:group).permit(:title, :description)
    end

end
