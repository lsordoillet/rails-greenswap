class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [ :show, :update ]

  def create
    @chatroom = Chatroom.new
    @chatroom.user = current_user
    @chatroom.listing = Listing.find(params[:listing_id])
    @chatroom.status = params[:status]
    @chatroom.save
    authorize @chatroom
    redirect_to chatroom_path(@chatroom)
  end

  def change_status
    @message.status = "cancelled"
  end

  def update
    @chatroom.status = params[:status]
    @chatroom.save
    authorize @chatroom
    redirect_to chatroom_path(@chatroom)
  end

 def show
    @message = Message.new
    # also created a message policy.. required? TODO: If not required, delete message policy
    # without the message form, it "works"
  end

  def set_chatroom
    @chatroom = Chatroom.find(params[:id])
    authorize @chatroom
  end
  
end
