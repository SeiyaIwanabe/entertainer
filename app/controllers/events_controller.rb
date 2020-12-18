class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_user, only: [:index, :new, :confirm, :create, :show]
  # before_action :set_event, only: [:show]

  def index
    @events = Event.all.page(params[:page]).per(5)
  end

  
  def new
    @event = Event.new
  end
  
  def confirm
    @event = Event.new(event_params)
    if @event.invalid?
      render :new
    end
  end

  def create
    @event = Event.new(event_params)
    render :new and return if params[:back] || !@event.save
    # redirect_to @event
    if @event.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def show
    @event = Event.find(params[:id])
    @recruiter = @event.recruiter
    # 後に実装↓
    # @entry = Entry.new
    # @applicants = Entry.where(event_id: @event.id).all
    # @comment = Comment.new
    # @comments = @event.comments.includes(:user)
  end
  
  private
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def event_params
    params.require(:event).permit(:event_name, :datetime, :prefecture, :place, :reward, :detail).merge(recruiter_id: current_user.id)
  end

  def set_user
    @user = current_user
  end

  # def set_event
  #   @event = Event.find(params[:id])
  # end

end
