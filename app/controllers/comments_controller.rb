class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
    redirect_to request.referer
      # render :index
    end
  end

  def destory
    @post    = Post.find(params[:post_id])
    @comment = @article.comments.find(params[:id])
    @comment.user_id = current_user.id
    if @comment.destroy
      render :index
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
