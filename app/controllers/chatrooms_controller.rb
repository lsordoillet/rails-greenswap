class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: :show

  def new
    @chatroom = Chatroom.new
    @chatroom.user = current_user
    @chatroom.listing = @listing
    @chatroom.status = "pending"
    @chatroom.save
    render :show
    authorize @chatroom
    # redirect_to @chatroom
  end
  
  def show
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
  
end
