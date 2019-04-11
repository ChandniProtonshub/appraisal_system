class UsersController < ApplicationController

  before_action :authenticate_user!
  
  def show
   @user = User.find_by_id(current_user.id)
 end

 def edit
  @user = User.find(current_user.id)
end

def update
	@user = User.find(current_user.id)
  if @user.update(user_params)
    redirect_to users_path, success: "Your information Update Successfully"
  else
    render 'edit'
  end
end

private
def user_params
	params.require(:user).permit(:fname, :lname, :email, :pnumber, :gender)
end
end