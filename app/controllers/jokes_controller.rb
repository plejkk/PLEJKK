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
    if joke.save
      flash[:notice] = "投稿しました。"
    end
    redirect_to jokes_path
  end

  def update
    joke = Joke.find(params[:id])
    if joke.update(joke_params)
      flash[:notice] = "投稿を更新しました。"
    end
    redirect_to jokes_path
  end

  def destroy
    joke = Joke.find(params[:id])
    if joke.destroy
      flash[:notice] = "投稿を削除いたしました。"
      redirect_to jokes_path
    end
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
