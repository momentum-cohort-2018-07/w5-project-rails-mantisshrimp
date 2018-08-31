class UsersController < ApplicationController

  def register
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :password))
    if @user.save
      redirect_to posts_path
    else
      render 'register'
    end
  end

end
