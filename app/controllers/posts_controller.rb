class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    # @posts = Post.order("created_at DESC")
    # @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(5)
    @post  = Post.new
    @q     = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
               .where(user_id: current_user.id)
               .order("created_at DESC")
               .page(params[:page])
               .per(5)
    @comment  = Comment.new
    @comments = @post.comments
  end

  def create
    @q     = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
               .order("created_at DESC")
               .page(params[:page])
               .per(5)
    @comment  = Comment.new

    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    flash[:success] = "投稿"
    redirect_to request.referer
  end

  def show
    @post     = Post.find(params[:id])
    @comment  = Comment.new
    @comments = @post.comments
  end


  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to request.referer
    end
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
end
