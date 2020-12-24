class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @hosted_events = Event.where(recruiter_id: current_user.id)
    @favorite_events = @user.favorite_events
    @entry_events = @user.entry_events

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
