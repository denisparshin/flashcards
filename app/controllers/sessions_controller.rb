class SessionsController < ApplicationController

  skip_before_action :require_login, except: [:destroy]

  def new
    @user = User.new
    @twitter_url = sorcery_login_url('twitter')
  end

  def create
    if @user = login(params[:email], params[:password])
      redirect_back_or_to(root_path, notice: 'Login successful')
    else
      flash.now[:alert] = 'Login failed'
      render action: 'new'
    end
  end

  def destroy
    logout
    redirect_back_or_to(root_path, notice: 'Logged out!')
  end

end
