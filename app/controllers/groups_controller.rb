class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :edit, :update, :destroy, :join, :quit]
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
      current_user.join!(@group)
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

  def join
    if !current_user.is_member_of?(@group)
      current_user.join!(@group)
      flash.notice = "加入群組成功！"
    else
      flash.notice = "你已經是這個群組的成員！"
    end
    redirect_to group_path(@group)
  end

  def quit
    if current_user.is_member_of?(@group)
      current_user.quit!(@group)
      flash.notice = "退出群組成功！"
    else
      flash.notice = "你不是這個群組的成員！"
    end
    redirect_to root_path(@group)
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
