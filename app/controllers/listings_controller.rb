class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_plant, only: [:destroy]
  
  def index
    @listings = policy_scope(Listing)
    if params["search"]
      @filter = params["search"]["plant_category"]["listing_type"]["care_level_category"].concat(params["search"]["strengths"]).flatten.reject(&:blank?)
      @listings = Listing.all.global_search("#{@filter}")
    else
      @listings = Listing.all
    end
    respond_to do |format|
      format.html
      format.js
    end  
  end

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing

    if @listing.save
      redirect_to @listing, notice: "Listing was added."
    else
      render :new
    end
  end

  def destroy
    @listing.destroy
    redirect_to listings_path, notice: "Listing was deleted!"
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :postcode, :city, :description, :active, :quantity, :price, :plant_category, :listing_type, :care_level_category, photos: [])
  end

  def set_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end
end