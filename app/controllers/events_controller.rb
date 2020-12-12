class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @user = current_user
    @events = Event.all
  end

  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @event = Event.find(params[:id])
  end
  
  private
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def event_params
    params.require(:event).permit(:event_name, :datetime, :prefecture, :reward, :detail).merge(recruiter_id: current_user.id)
  end

end
