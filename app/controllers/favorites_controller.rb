class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @joke = Joke.find(params[:joke_id])
    @favorite = current_user.favorites.new(joke_id: @joke.id)
    @favorite.save
  end

  def destroy
    @user = current_user
    @joke = Joke.find(params[:joke_id])
    @favorite = current_user.favorites.find_by(joke_id: @joke.id)
    @favorite.destroy
  end
end
