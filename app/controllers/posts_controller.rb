class PostsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]

	def index
		@posts = Post.all.reverse_order!.page(params[:page]).per(3)
		@post = Post.new
		@comment = Comment.new
	end

	def create
		@post = Post.new(post_params)
		@post.user_id = current_user.id
		@post.save
		redirect_to :back 
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to :back
	end

	private

	def post_params
		params.require(:post).permit(:text)
	end 
end
