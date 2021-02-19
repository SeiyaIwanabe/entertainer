class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password])
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
