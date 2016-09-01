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
			redirect_to :back, notice: "Post created"
		else
			redirect_to :back, alert: "Post not created"
		end
	end
	
	def update
		if @post.update(post_params)
			redirect_to :back, notice: "Post updated"
		else
			redirect_to :back, alert: "Post not updated"
		end
	end

	def destroy
		if @post.destroy
			redirect_to :back, notice: "Post destroyed"
		end
	end

	private

	def post_params
		params.require(:post).permit(:text)
	end 

	def set_post
		@post = Post.find(params[:id])
	end
end
