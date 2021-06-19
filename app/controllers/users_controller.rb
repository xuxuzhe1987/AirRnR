class UsersController < ApplicationController

  before_action :set_user, only: [:show]


  def index
    @users = User.all
  end

  def show

  end

  def edit
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :address, :we_chat)
  end

end
