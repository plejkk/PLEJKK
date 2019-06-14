class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_check, only:[:index]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  def destroy
  end

  def admin_check
    if current_user.admin == false
      redirect_to jokes_path
    end
  end
end
private

def user_params
  params.require(:user).permit(:email)
end
