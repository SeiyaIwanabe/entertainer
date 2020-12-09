class EventsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @user = current_user
  end

  def new
    @event
  end

  def create
    @event = Event.new(event_params)
  end
      

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def event_params
    params.require(:event).permit(:event_name, :datetime, :place, :reward, :detail).includes(:user)
  end

end
