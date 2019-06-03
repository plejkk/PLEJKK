class CommentsController < ApplicationController

  def create
    joke = Joke.find(params[:joke_id])
    comment = Comment.new(joke_comment_params)
    comment.joke_id = joke.id
    comment.user_id = current_user.id
    comment.save
    redirect_to joke_path(joke)
  end

  def destroy
  end
end

  private
  def  joke_comment_params
  	params.require(:comment).permit(:user_id, :joke_id, :body)
  end
