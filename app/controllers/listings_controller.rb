class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_listing, only: [:destroy, :show]

  def index
    @listings = policy_scope(Listing)
    if params["search"].present?
      if params["search"]["plant_category"].present? && params["search"]["plant_category"].second.present?
        @listings = @listings.where(plant_category: params["search"]["plant_category"])
      end
      if params["search"]["listing_type"].present? && params["search"]["listing_type"].second.present?
       @listings = @listings.where(listing_type: params["search"]["listing_type"])
      end
      if params["search"]["care_level_category"].present? && params["search"]["care_level_category"].second.present?
       @listings = @listings.where(care_level_category: params["search"]["care_level_category"])
      end
    end
  end



  def new
    @listing = Listing.new
    authorize @listing
  end

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def show

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
