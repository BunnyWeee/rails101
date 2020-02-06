class GroupsController < ApplicationController
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @group = Group.all
  end

  def show
    @posts = @group.posts
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    
    if @group.save
      redirect_to root_path, notice: "新增群組成功！"
    else
      render :new
    end
  end

  def edit
  end
  
  def update

    if @group.update(group_params)
      redirect_to root_path, notice: "更新群組成功！"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to root_path, notice: "刪除群組成功！"
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end

  def find_params
    @group = Group.find(params[:id])
  end
end
