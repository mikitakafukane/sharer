class UsersController < ApplicationController
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
               .page(params[:page])
               .per(8)
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @like_posts = @user.like_posts
    @comment_posts = @user.comment_posts
    @task = Task.find(params[:id])
    @tasks = @user.tasks
    # @tasks = Task.all.includes(:user)
    @belongings = Belonging.where(user_id: current_user.id)
    @rooms = @user.rooms
    # ---------chats----------
    @personal_rooms = current_user.belongings.pluck(:room_id)
    @personal_belongings = Belonging.find_by(user_id: @user.id, room_id: @personal_rooms)
    
      @room = @personal_belongings.room
    
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
    # ---------chats---------
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
