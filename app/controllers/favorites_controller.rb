class FavoritesController < ApplicationController
  def index
  	@favorites = Favorite.all
  end

  def create
    joke = Joke.find(params[:joke_id])
    favorite = current_user.favorites.new(joke_id: joke.id)
    favorite.save
    redirect_to jokes_path
  end

  def destroy
    binding.pry
    joke = Joke.find(params[:joke_id])
    favorite = current_user.favorites.find_by(joke_id: joke.id)
    favorite.destroy
    redirect_to jokes_path
  end
end
