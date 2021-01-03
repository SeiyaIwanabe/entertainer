class EntriesController < ApplicationController

  def create
    @entry = current_user.entries.build(event_id: params[:event_id])
    if @entry.save
      flash[:notice] = "申し込みが完了しました"
      redirect_to root_path
    else
      render template: "events/show"
    end
  end

end
