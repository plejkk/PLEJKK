class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_check, only:[:index]
  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
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

def joke_params
  params.require(:joke).permit(:e_body, :j_body, :e_caption, :j_caption, :e_speak, :j_speak)
end
