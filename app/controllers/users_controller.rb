class UsersController < ApplicationController
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
end
private

def joke_params
  params.require(:joke).permit(:e_body, :j_body, :e_caption, :j_caption, :e_speak, :j_speak)
end
