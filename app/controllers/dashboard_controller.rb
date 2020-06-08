class DashboardController < ApplicationController
  before_action :set_dashboard, only: [:update, :edit]
  def profile
    @listings = current_user.listings
    @my_chatrooms = current_user.chatrooms # Maybe wrong?
    @my_favorites = current_user.favorites
  end
  
  def edit
  end

  def update
    if @profile.update(dashboard_params)
     redirect_to profile_path, notice: "Profile was updated."
    else
     render "dashboard/edit"
    end
  end

  private

  def dashboard_params
    params.require(:user).permit(:username, :email, :avatar, :description)
  end

  def set_dashboard
    @profile = User.find(params[:current_user_id])
  end
end
