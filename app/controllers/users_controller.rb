class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @events = @user.events
    @favorite_events = @user.favorite_events
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to action: :show
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :genre, :introduction, :icon)
  end
end
