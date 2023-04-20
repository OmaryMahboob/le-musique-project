class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @user_chatrooms = Chatroom.where(sender: current_user).or(Chatroom.where(receiver: current_user))
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user
    if @message.save
      ChatroomChannel.broadcast_to(
        @chatroom,
          {user_id: current_user.id, data: render_to_string(partial: "message", locals: {message: @message, last_date: @message.created_at.to_date, last_time: @message.created_at.strftime("%H:%M")})}
      )
      head :ok
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:private_message)
  end
end
