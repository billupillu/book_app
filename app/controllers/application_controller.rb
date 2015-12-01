class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

	private
		def current_user
			@current_user ||= User.find(session[:user_id]) if session[:user_id]
		end

		helper_method :current_user

		def require_signin
			unless current_user
				flash[:danger] = "Please signin first"
				session[:desired_destination] = request.fullpath
				redirect_to signin_path
			end
		end

		def require_admin
			unless current_user.admin?
				flash[:danger] = "Admin access only"
				redirect_to root_path
			end
		end	

end
