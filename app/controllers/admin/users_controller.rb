class Admin::UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :authenticate_admin

	def index
		@users = User.all
	end

	def show
		@user = User.find_by_id(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find_by_id(params[:id])
		if @user.update(user_params)
			redirect_to admin_users_path, success: "User information Update Successfully"
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to admin_root_path, success: "User Deleted Successfully"
	end
	private

	def user_params
		params.require(:user).permit(:fname, :lname, :email, :pnumber, :gender)
	end

	def authenticate_admin
		unless current_user.is_admin?
			redirect_to welcome_index_path
		end
	end
end






