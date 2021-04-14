class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.order("created_at DESC")
    @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to request.referer
    
  end

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
