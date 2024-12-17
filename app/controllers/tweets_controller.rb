class TweetsController < ApplicationController
  before_action :require_user_loged_in!

  def index
    @tweets = Current.user.tweets
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Current.user.tweets.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: "Tweet was scheduled"
    else
      render :new
    end
  end

  private

  def tweets_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end
end
