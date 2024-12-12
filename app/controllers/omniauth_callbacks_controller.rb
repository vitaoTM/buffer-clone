class OmniauthCallbacksController < ApplicationController
  def twitter
    Rails.logger.info auth
    Current.user.twitter_accounts.create(
      name: auth.info.name,
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret,
    )

    redirect_to root_path, notice: "Account connected Successfuly"
  end

  def auth
    request.env("omniauth.auth")
  end
end
