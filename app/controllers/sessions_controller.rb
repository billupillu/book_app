class SessionsController < ApplicationController

	def new
		redirect_to root_path if current_user
	end


	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			flash[:success] = "Successfuly Signed in"
			if session[:desired_destination]
				redirect_to session[:desired_destination]
			else	
				redirect_to root_path
			end	
		else
			flash.now[:danger] = "Invalid combination of email and password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Successfuly Signed Out"
		redirect_to root_path
	end
end
