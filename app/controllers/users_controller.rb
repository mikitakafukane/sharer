class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @q     = User.ransack(params[:q])
    @users = @q.result(distinct: true).
      page(params[:page]).
      per(8)
  end

  def show
    @user  = User.find(params[:id])
    @rooms = @user.rooms
    @tasks = @user.tasks

    @posts = @user.posts
                  .order(created_at: :desc)
                  .page(params[:post_page])
                  .per(5)
    @like_posts    = @user.like_posts
                          .order(created_at: :desc)
                          .page(params[:like_page])
                          .per(5)
    @comment_posts = @user.comment_posts
                          .order(created_at: :desc)
                          .page(params[:comment_page])
                          .per(5)
    @liked_posts     = Like.where(post_id: @posts.pluck(:id))
                           .order(created_at: :desc)
                           .page(params[:liked_page])
                           .per(5)
    @commented_posts = Comment.where(post_id: @posts.pluck(:id))
                           .order(created_at: :desc)
                           .page(params[:commented_page])
                           .per(5)

    @chat_rooms = current_user.belongings.pluck(:room_id)
    @chats      = Chat.where(room_id: @chat_rooms)
                      .order(created_at: :desc)
                      .page(params[:chat_page])
                      .per(5)
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
