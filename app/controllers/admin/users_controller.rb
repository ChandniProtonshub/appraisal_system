class Admin::UsersController < ApplicationController

  before_action :authenticate_user!

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
     @user = User.find(params[:id])
      if @user.update(user_params)
	  	redirect_to admin_users_path
	  else
	  	render 'edit'
	 end
	end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_root_path
	end

	def assign_questions
	  @user = User.where(id: params[:user_id]).first
	  @questions = Question.all
    end

private

def user_params
	params.require(:user).permit(:fname, :lname, :email, :pnumber, :gender)
end
end