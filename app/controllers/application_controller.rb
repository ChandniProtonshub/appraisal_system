class ApplicationController < ActionController::Base
# protect_from_forgery with: :exception
 before_action :configure_permitted_parameters, if: :devise_controller?
 # before_action :single_user_login

 protected

 # def after_sign_up_path_for(resource)  
 #   # users_show
 #   users_path(resource)
 # end

def after_sign_in_path_for(user)
if user.is_admin?
    admin_users_path
  else
    users_path
  end
end
 
 def configure_permitted_parameters
 devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:fname, :lname, :email, :pnumber, :gender, :email, :password, :current_password) }
 devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:lname, :fname, :pnumber, :gender, :email, :password, :current_password) }
 devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:email, :password)}
  end

   # def single_user_login
   #   if params[:controller] == "users" && params[:action] == "show"
   #    return if current_user.id == params[:id]
   #  else
   #    flash[:notice] = "Cannot access"
   #    redirect_to users_path
   #  end
   # end


 # def require_system_admin
 #  	unless current_user.present? && current_user.is_admin
	# 	flash[:alert] = "You need to be an admin to do that."
	# 	redirect_to root_path
	# end
 #  end
end
  

# sonam@gmail.com
# 123456




