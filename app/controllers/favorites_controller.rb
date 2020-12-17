class FavoritesController < ApplicationController

  def create
    @favorite = current_user.favorites.build(event_id: params[:event_id])
    @favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @favorite = Favorite.find_by(event_id: params[:event_id], user_id: current_user.id)
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
