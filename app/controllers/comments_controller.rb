class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    # binding.pry
    joke = Joke.find(params[:joke_id])
    comment = Comment.new(joke_comment_params)
    comment.joke_id = joke.id
    comment.user_id = current_user.id
    comment.save
    redirect_to joke_path(joke)
  end

  def destroy
    binding.pry
    # joke_idは送られてきている。
    # しかし、comment_idがnilになっている
    # したがってcomment_idを特定して削除することができなくなっている。
    joke = Joke.find(params[:joke_id])
    # comment = Comment.find(params[:comment_id])
    comment = current_user.comments.find_by(comment_id: comment.id)
    comment.destroy
    redirect_to joke_path(params[:joke_id])
  end
end
private

def joke_comment_params
  params.require(:comment).permit(:user_id, :joke_id, :body)
end
