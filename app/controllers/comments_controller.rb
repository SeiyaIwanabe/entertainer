class CommentsController < ApplicationController
  # before_action :set_event, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      @comment = Comment.new
      # get_all_comments
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if @comment.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params  
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, event_id: params[:event_id])
  end

  # def set_event
  #   @event = Event.find_by(id: params[:id])
  # end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # def get_all_comments
  #   @comments = @event.comments.includes(:user).order('created_at asc')
  # end

end
