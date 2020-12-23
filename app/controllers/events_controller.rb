class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_user, only: [:index, :new, :confirm, :create, :show, :search]

  def index
    @tags1 = ActsAsTaggableOn::Tag.where("id < ?", 10)
    @tags2 = ActsAsTaggableOn::Tag.where(id: 11..22)
    @tags3 = ActsAsTaggableOn::Tag.where(id: 23...29)
    @tags4 = ActsAsTaggableOn::Tag.where(id: 29...31)
    if params[:tag_name]
      @events = Event.tagged_with("#{params[:tag_name]}").includes(:recruiter).page(params[:page]).per(5)
      # タグ検索時にそのタグずけしているものを表示
    else
      @events = Event.all.includes(:recruiter).page(params[:page]).per(5)
    end
    @users = User.all.page(params[:page]).per(9)
  end

  def new
    @event = Event.new
    # @tags = ActsAsTaggableOn::Tag.all
  end
  
  def confirm
    @event = Event.new(event_params)
    if @event.invalid?
      render :new
    end
  end

  def create
    @event = Event.new(event_params)
    @event.recruiter_id = current_user.id
    render :new and return if params[:back] || !@event.save
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @event = Event.find_by(id: params[:id])
    @recruiter = @event.recruiter
    # 後に実装↓
    # @entry = Entry.new
    # @applicants = Entry.where(event_id: @event.id).all
    # @comment = Comment.new
    # @comments = @event.comments.includes(:user)
  end

  def search
    @events = Event.all.includes(:recruiter).page(params[:page]).per(5)
    @tags1 = ActsAsTaggableOn::Tag.where("id < ?", 10)
    @tags2 = ActsAsTaggableOn::Tag.where(id: 11..22)
    @tags3 = ActsAsTaggableOn::Tag.where(id: 23...29)
    @tags4 = ActsAsTaggableOn::Tag.where(id: 29...31)
  end
  
  private
  # def move_to_index
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end

  def event_params
    params.require(:event).permit(:event_name, :datetime, :prefecture, :place, :detail, :tag_list)
  end

  def set_user
    @user = current_user
  end


end