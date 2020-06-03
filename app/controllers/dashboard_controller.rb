class DashboardController < ApplicationController
  def profile
    @listings = current_user.listings
  end
end
