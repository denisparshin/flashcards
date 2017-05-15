class UsersController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
  
  def new
    @user = User.new
  end

  def edit
  end
  
  def update
    if current_user.update(user_params)
      redirect_to edit_user_path,
      notice: 'Successfully updated'
    else
      redirect_to edit_user_path,
      notice: 'Failed. Try another email/password'
    end

  end

  def create
    @user = User.new(user_params)
    if @user.save
      auto_login(@user)
      redirect_to root_url, :notice => "Signed up!"
    else
      render :new, :notice => "Failed"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
