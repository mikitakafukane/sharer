class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q     = User.ransack(params[:q])
    @users = @q.result(distinct: true)
               .page(params[:page])
               .per(8)
  end

  def show
    @user  = User.find(params[:id])
    @rooms = @user.rooms

    @task  = Task.find(params[:id])
    @tasks = @user.tasks

    @posts         = @user.posts
    @like_posts    = @user.like_posts
    @comment_posts = @user.comment_posts
    @liked_posts = Like.where(post_id: @posts.pluck(:id))
    @commented_posts = Comment.where(post_id: @posts.pluck(:id))

    @chat_rooms = current_user.belongings.pluck(:room_id)
    @chats      = Chat.where(room_id: @chat_rooms)
                      .order("created_at DESC")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "ユーザー情報を変更しました"
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :image, :email, :belonging)
  end

end
