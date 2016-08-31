class PostsController < ApplicationController
	
	before_action :authenticate_user!, except: [:index]
	before_action :set_post, only: [:update, :destroy]

	def index
		@posts = Post.all.page(params[:page]).per(3)
		@post = Post.new
		@comment = Comment.new
	end

	def create
		@post = current_user.posts.new(post_params)
		if @post.save
			redirect_to :back
		end
	end
	
	def update
		@post.update(post_params)
		redirect_to :back
	end

	def destroy
		@post.destroy
		redirect_to :back
	end

	private

	def post_params
		params.require(:post).permit(:text)
	end 

	def set_post
		@post = Post.find(params[:id])
	end
end
