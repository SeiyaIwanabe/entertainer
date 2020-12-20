class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_user, only: [:index, :new, :confirm, :create, :show, :search]

  def index
    @events = Event.all.includes(:recruiter).page(params[:page]).per(5)
    if params[:tag_name]
      @events = Event.tagged_with("#{params[:tag_name]}").page(params[:page]).per(5)
    end
    @tags = Event.tag_counts_on(:tags).most_used(20)
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

  def search
    @events = Event.all.includes(:recruiter)
  end
  
  private
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def event_params
    params.require(:event).permit(:event_name, :datetime, :prefecture, :place, :genre, :detail, :tag_list).merge(recruiter_id: current_user.id)
  end

  def set_user
    @user = current_user
  end


end
