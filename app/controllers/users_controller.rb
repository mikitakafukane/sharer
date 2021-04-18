class UsersController < ApplicationController
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def belonging
    Belonging.create(user_id: params[:user_id], group_id: params[:group_id])
  end
  
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @like_posts = @user.like_posts 
    @comment_posts = @user.comment_posts
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
