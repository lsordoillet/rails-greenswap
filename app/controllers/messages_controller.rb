class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    
    if @message.save
      redirect_to chatroom_path(@chatroom), anchor: "message-#{@message.id}" #TODO: is chatroom_path here correct? 
      ChatroomChannel.broadcast_to(
        @chatroom,
        render_to_string(partial: "message", locals: { message: @message })
      )
    else
      render "chatrooms/show"
    end
    authorize @message
  end

  private

  def message_params
    params.required(:message).permit(:content)
  
  end

end
