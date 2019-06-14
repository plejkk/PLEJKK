class JokesController < ApplicationController
  before_action :authenticate_user!, only:[:show, :new, :edit, :create, :destroy]
  before_action :admin_check, only:[:new ,:show, :edit, :update, :create, :destroy]
  PER = 25
  def new
    @joke = Joke.new
  end

  def index
    @jokes = Joke.search(params[:search]).order(id: "DESC").page(params[:page]).per(PER).reverse_order
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
    @joke = Joke.new(joke_params)
    if @joke.save
      redirect_to jokes_path, success: "新規投稿しました"
    else
      render :new
    end
  end

  def update
    @joke = Joke.find(params[:id])
    if @joke.update(joke_params)
      redirect_to jokes_path, success: "投稿を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @joke = Joke.find(params[:id])
    if @joke.destroy
      redirect_to jokes_path, success: "投稿を削除しました"
    else
      redirect_to joke_path(@joke.id)
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
