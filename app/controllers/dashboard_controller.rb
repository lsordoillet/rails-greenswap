class DashboardController < ApplicationController
  before_action :set_dashboard, only: [:update]
  def profile
    @listings = current_user.listings
    @my_chatrooms = current_user.chatrooms # Maybe wrong?
  end

  def update
    @profile.update(dashboard_params)
    redirect_to profile_path, notice: "Profile was updated."
  end

  private

  def dashboard_params
    params.require(:user).permit(:username, :email, :avatar, :description)
  end

  def set_dashboard
    @profile = User.find(params[:current_user_id])
  end
end
