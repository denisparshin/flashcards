class Users::OmniauthCallbacksController < ApplicationController
  def twitter
     @user = User.find_for_twitter_oauth request.env["omniauth.auth"]
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Twitter"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
  end

  def self.find_for_twitter_oauth access_token
    if user = User.where(:url => access_token.info.urls.Twitter).first
      user
    else 
      User.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
    end
end
