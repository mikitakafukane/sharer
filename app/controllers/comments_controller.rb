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

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      # render
      redirect_to request.referer
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
