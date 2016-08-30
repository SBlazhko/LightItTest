class UsersController < ApplicationController
	
	def show
		if current_user
			redirect_to posts_path
		else
			redirect_to new_user_session_path
		end
	end
end
