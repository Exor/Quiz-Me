class UsersController < ApplicationController
	before_action :signed_in_user, only: [:edit, :update]
	before_action :correct_user,   only: [:edit, :update]
	
	def edit
	end
	
	def update
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to browse_path
		else
			render 'edit'

		end
	end
	
	private
	
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
		
		def correct_user
			@user = User.find(params[:id])
			redirect_to(root_url) unless current_user?(@user)
		end
end
