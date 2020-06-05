class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: :show

  def new
    @chatroom = Chatroom.new
    @chatroom.user = current_user
    @chatroom.listing = Listing.find(params[:listing_id])
    @chatroom.status = "pending"
    @chatroom.save
    authorize @chatroom

    render :show
    # ?redirect_to @chatroom
  end
  
  def show
    @message = Message.new
    authorize @message
    # I also created a message policy.. required? TODO: If not required, delete message policy
    # without the message form, it "works"
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
  
end
