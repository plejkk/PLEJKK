class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def create
    joke = Joke.find(params[:joke_id])
    favorite = current_user.favorites.new(joke_id: joke.id)
    favorite.save
    redirect_to jokes_path
  end

  def destroy
    joke = Joke.find(params[:joke_id])
    favorite = current_user.favorites.find_by(joke_id: joke.id)
    favorite.destroy
    redirect_to jokes_path
  end
end
