class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    # redirect_to request.referer
  end

  def destroy
    @post    = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    # redirect_to request.referer
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
