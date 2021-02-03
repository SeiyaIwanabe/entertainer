class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :confirm, :create, :edit, :destroy]
  before_action :set_user, only: [:index, :new, :confirm, :create, :show, :edit, :search]

  def index
    @tags1 = ActsAsTaggableOn::Tag.where("id < ?", 10)
    @tags2 = ActsAsTaggableOn::Tag.where(id: 11..22)
    @tags3 = ActsAsTaggableOn::Tag.where(id: 23...29)
    @tags4 = ActsAsTaggableOn::Tag.where(id: 29...31)
    if params[:tag_name]
      # タグ検索時にクリックしたタグが付与されているイベントを一覧表示
      @events = Event.tagged_with("#{params[:tag_name]}").includes(:recruiter).page(params[:page]).per(10)
      @recommended_events = Event.joins(:entries).group(:event_id).having('count(*) >= 3')
    else
      @events = Event.all.includes(:recruiter).page(params[:page]).per(10)
      #申し込みの数が3つ以上のイベントを一覧表示
      @recommended_events = Event.joins(:entries).group(:event_id).having('count(*) >= 3')
    end
    @users = User.all.page(params[:page]).per(9)
  end

  def new
    @event = Event.new
  end
  
  def confirm
    @event = Event.new(event_params)
    if @event.invalid?
      flash.now[:alert] = '必要な項目を入力してください'
      render :new
    end
  end

  def create
    @event = Event.new(event_params)
    @event.recruiter_id = current_user.id
    render :new and return if params[:back] || !@event.save
    if @event.save
      redirect_to root_path, notice: 'イベントを作成しました'
    else
      render :new
    end
  end
  
  def show
    @event = Event.find_by(id: params[:id])
    @recruiter = @event.recruiter
    @comment = Comment.new
    @comments = @event.comments.includes(:user).order(created_at: :desc)
    @entry = Entry.new
    @applicants = Entry.where(event_id: @event.id).all
  end

  def edit
    @event = Event.find_by(id: params[:id])
    if @event.recruiter_id == current_user
      render "edit"
    else
      redirect_to root_path
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to root_path, notice: 'イベントを更新しました'
    else
      render :edit, alert: 'イベントを更新出来ませんでした'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:id])
    if @event.recruiter_id == current_user.id
      @event.destroy
    end
    redirect_to root_path
  end
    


  def search
    @events = Event.all.includes(:recruiter).page(params[:page]).per(10)
    @tags1 = ActsAsTaggableOn::Tag.where("id < ?", 10)
    @tags2 = ActsAsTaggableOn::Tag.where(id: 11..22)
    @tags3 = ActsAsTaggableOn::Tag.where(id: 23...29)
    @tags4 = ActsAsTaggableOn::Tag.where(id: 29...31)
    @recommended_events = Event.joins(:entries).group(:event_id).having('count(*) >= 3')
  end
  
  private

  def event_params
    params.require(:event).permit(:event_name, :start_time, :prefecture, :place, :detail, :tag_list)
  end

  def set_user
    @user = current_user
  end
end