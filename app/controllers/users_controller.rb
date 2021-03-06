class UsersController < ApplicationController
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def top_reviewers
    @user = User.top_reviewers
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
