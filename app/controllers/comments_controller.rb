class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: :destroy

  def create
    @comment = @event.comments.create(comment_params)
    if @comment.save
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @comment.destroy
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
