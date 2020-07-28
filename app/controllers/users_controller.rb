class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #log user in
      session[:user_id] = @user.id
      #redirect to the show page
      redirect_to @user
    else
      render :new
    end
  end

  def show
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
