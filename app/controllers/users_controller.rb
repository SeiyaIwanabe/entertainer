class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :icon]

  def show
    @hosted_events = Event.where(recruiter_id: current_user.id)
    @favorite_events = @user.favorite_events
    @entry_events = @user.entry_events
  end

  def edit
  end

  def icon
  end
  
  def update
    if @user.update(user_params)
      flash[:notice] = "更新が完了しました。"
      redirect_to action: :show
    else
      flash.now[:alert] = "更新に失敗しました。"
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :genre, :introduction, :icon)
  end
end
