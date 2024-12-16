class TwitterAccountsController < ApplicationController
  before_action :require_user_loged_in!
  def index
    @twitter_accounts = Current.user.twitter_accounts
  end

  def destroy
    @twitter_account = Current.user.twitter_accounts.find(params[:id])
    @twitter_account.destroy
    redirect_to twitter_accounts_path, notice: "#{@twitter_account.username} Disconnected "
  end
end
