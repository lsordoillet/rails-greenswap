class ListingsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def show
    @listing = Listing.find(params[:id])
    authorize @listing
  end
end
