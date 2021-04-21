class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @posts = Post.order("created_at DESC")
    # @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
    @post  = Post.new
    @q     = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
               .order("created_at DESC")
               .page(params[:page])
               .per(5)
    @comment  = Comment.new
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to request.referer
  end
  
  def show
    @post     = Post.find(params[:id])
    @comment  = Comment.new
    @comments = @post.comments
  end
  

  def destroy
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
