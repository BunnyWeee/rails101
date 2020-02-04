class GroupsController < ApplicationController
  def index
    @group = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    
    if @group.save
      redirect_to root_path, notice: "新增群組成功！"
    else
      render :new
    end
  end

  def edit
    @group = Group.find_by(id: params[:id])
  end
  
  def update
    @group = Group.find_by(id: params[:id])

    if @group.update(group_params)
      redirect_to root_path, notice: "更新群組成功！"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find_by(id: params[:id])
    @group.destroy if @group
    redirect_to root_path, notice: "刪除群組成功！"
  end

  private
  def group_params
    params.require(:group).permit(:title, :description)
  end
end
