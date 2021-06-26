class UsersController < ApplicationController

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = current_user
    authorize @user
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :we_chat, :avatar)
  end

end
