# class MessagesController < ApplicationController
#   def create
#     @chatroom = Chatroom.find(params[:chatroom_id])
#     # @messages = Message.all
#     @message = Message.new(message_params)
#     @message.user = current_user
#     @message.save
#     redirect_to chatroom_path(@message.chatroom)
#   end

#   private

#   def message_params
#     params.require(:message).permit(:private_message, :chatroom_id)
#   end
# end


class MessagesController < ApplicationController

  def create
      @message = current_user.messages.create(body: msg_params[:body], room_id: params[:room_id])
  end
  private
  def msg_params
      params.require(:message).permit(:body)
  end
end
