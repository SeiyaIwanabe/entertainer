class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.create(event_id: params[:event_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @event = Event.find(params[:event_id])
    @favorite = current_user.favorites.find_by(event_id: @event.id)
    @favorite.destroy
    ridirect_back(fallback_location: root_path)
end
