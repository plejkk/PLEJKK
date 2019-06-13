class JokesController < ApplicationController
  before_action :authenticate_user!, only:[:show, :new, :edit, :create, :destroy]
  before_action :admin_check, only:[:new ,:show, :edit, :update, :create, :destroy]
  def new
    @joke = Joke.new
  end

  def index
    @jokes = Joke.search(params[:search])
  end

  def show
    @joke = Joke.find(params[:id])
    @comments = Comment.where(joke_id: params[:id])
    @comment = Comment.new
  end

  def edit
    @joke = Joke.find(params[:id])
  end

  def create
    joke = Joke.new(joke_params)
    joke.save
    redirect_to jokes_path, success: "新規投稿しました"
  end

  def update
    joke = Joke.find(params[:id])
    joke.update(joke_params)
    redirect_to jokes_path, success: "投稿を更新しました"
  end

  def destroy
    joke = Joke.find(params[:id])
    joke.destroy
    redirect_to jokes_path, success: "投稿を削除しました"
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
