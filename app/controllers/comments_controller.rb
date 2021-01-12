# comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_tweet

  def new
    @comment = @tweet.comments.new
  end

  def create
    @comment = @tweet.comments.create!(comment_params)
    respond_to do |format|
      format.html { redirect_to @tweet }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
