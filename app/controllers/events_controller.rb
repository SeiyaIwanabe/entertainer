class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_user, only: [:index, :new, :confirm, :create, :show]
  before_action :set_search

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

  #イベント検索アクション
  def set_search
    @search = Event.ransack(params[:q]) #ransackの検索メソッド
    @search_events = @search.result(distinct: true).order(created_at: "DESC").includes(:recruiter).page(params[:page]).per(5) # eventsの検索結果一覧 
    # 最終的に、@search_eventsを検索結果画面（例：search.html.haml）に挿入します。
    # 検索結果の一覧：  @search_events = @search.result.order(created_at: "DESC")
    # distinct: trueは検索結果のレコード重複しないようにします。
    # ページネーション:  .includes(:recruiter).page(params[:page]).per(5)
  end

end
