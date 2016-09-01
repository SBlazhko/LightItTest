class CommentsController < ApplicationController

	before_action :get_parent
  before_action :authenticate_user!
   
  def new
    @comment = @parent.comments.new
  end
 
  def create
    @comment = @parent.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save 
      redirect_to :back, notice: "Comment created"
    else
      redirect_to :back, alert: "Comment not created"
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    if comment.destroy
      redirect_to :back, notice: "Comment destroyed"
    end
  end
 
  private
   
  def comment_params
    params.require(:comment).permit(:text)
  end 

  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  end
end
