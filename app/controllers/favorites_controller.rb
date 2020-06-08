class FavoritesController < ApplicationController
  before_action :set_favorite, only: [:show, :destroy]

  def create
    @favorite = Favorite.new
    @favorite.user = current_user
    @favorite.listing = Listing.find(params[:listing_id])
    @favorite.save
    authorize @favorite
    redirect_to profile_path
  end

  def show

  end

  def set_favorite
    @favorite = Favorite.find(params[:id])
    authorize @favorite
  end

  def destroy
    @favorite.destroy
    redirect_to profile_path(current_user), notice: "Favorite was removed!"
  end
end
