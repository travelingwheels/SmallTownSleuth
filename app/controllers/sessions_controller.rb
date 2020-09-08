class SessionsController < ApplicationController
  skip_before_action :redirect_if_not_logged_in

  def home
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "We're sorry, but we couldn't validate your credentials,
      please signup or try logging in again"
      redirect_to login_path
    end
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
