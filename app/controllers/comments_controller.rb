class CommentsController < ApplicationController

	before_action :get_parent
  before_action :authenticate_user!
   
  def new
    @comment = @parent.comments.new
  end
 
  def create
    @comment = @parent.comments.new(comment_params)
    @comment.user_id = current_user.id
    redirect_to :back if @comment.save
  end

  def destroy
    comment = Comment.find(params[:id])
    redirect_to :back if comment.destroy
  end
 
  protected
   
  def comment_params
    params.require(:comment).permit(:text)
  end 

  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  end
end
