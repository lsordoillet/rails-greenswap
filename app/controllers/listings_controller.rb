class ListingsController < ApplicationController
  before_action :set_plant, only: [:destroy]
  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new
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


<%= simple_form_for(@listing) do |f| %>
    <%= f.input :title %>
    <%= f.input :postcode %>
    <%= f.input :city %>
    <%= f.input :description %>
    <%= f.input :active %>
    <%= f.input :quantity %>
    <%= f.input :price %>
    <%= f.select :plant_category, collection: Listing::PLANT_CATEGORY %>
    <%= f.select :listing_type, collection: Listing::LISTING_TYPE %>
    <%= f.select :care_level_category, collection: Listing::CARE_LEVEL_CATEGORY %>
    <%= f.input :photos, as: :file, input_html: { multiple: true } %>
    <%= f.submit "Add listing", class: "btn-blue" %>
  <% end %>
  
  </div>
  
  