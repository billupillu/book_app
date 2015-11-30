class UsersController < ApplicationController
	#sncd
	before_action :find_users, only: [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User has been created"
      redirect_to @user
    else
      flash[:danger] = "User has not been created"
      render :new
    end
  end

  def destroy
    @user.destroy
    flash[:success] = "User has been deleted"
    redirect_to root_path
  end

  private

    def find_users
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
end
