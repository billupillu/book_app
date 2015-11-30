class SessionsController < ApplicationController

	def new
		redirect_to root_path if current_user
	end


	def create
		if user = User.authenticate(params[:email], params[:password])
			session[:user_id] = user.id
			flash[:success] = "Successfuly Signed in"
			redirect_to root_path
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
