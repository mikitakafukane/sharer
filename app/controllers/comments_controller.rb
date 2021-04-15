class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    comment.save
    redirect_to request.referer
  end
  
  def destory
    comment = Comment.find_by(post_id: params[:post_id], user_id: current_user.id)
    comment.destroy
    redirect_to posts_path
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
