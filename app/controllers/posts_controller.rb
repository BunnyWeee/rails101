class PostsController < ApplicationController
  before_action :find_group
  before_action :find_post, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :member_required, only: [:new, :create]
  def new
    @post = @group.posts.build
  end

  def create
    @post = @group.posts.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group), notice: "建立貼文成功！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to group_path(@group), notice: "更新貼文成功！"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to group_path(@group), notice: "刪除貼文成功！"
  end

  private
  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_post
    @post = current_user.posts.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:content)
  end

  def member_required
    if !current_user.is_member_of?(@group)
      flash.notice = "你不是這個群組的會員！"
      redirect_to group_path(@group)
    end
  end
end
