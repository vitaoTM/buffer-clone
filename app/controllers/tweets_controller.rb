class TweetsController < ApplicationController
  before_action :require_user_loged_in!
  before_action :set_tweet, only: [:show, :destroy, :update]

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

  def edit
  end

  def update
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "Tweet was scheduled successfuly"
    else
      render :edit
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet was unscheduled"
  end

  private

  def tweets_params
    params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
  end

  def set_tweet
    @tweet = Current.user.tweets.find(params[:id])
  end
end
