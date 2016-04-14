class UsersController < ApplicationController
	def index
		redirect_to sign_in_path if current_user == nil
	end

	def show
		@user = User.find(params[:id])
		@read = true
	end

	def edit
		@user = User.find(current_user.id)
		@read = false
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path
		else
			render :edit
		end
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :avatar)
	end
end
