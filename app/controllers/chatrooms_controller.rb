class ChatroomsController < ApplicationController
  @chatroom = Chatroom.find(params[:id])
end
