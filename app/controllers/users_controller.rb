class UsersController < ApplicationController

  
  def show
	@user = User.find_by_id(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
	@user = User.find(current_user.id)
      if @user.update(user_params)
	  	redirect_to users_path
	  else
	  	render 'edit'
	 end
   end

private
  def user_params
	params.require(:user).permit(:fname, :lname, :email, :pnumber, :gender)
  end
end