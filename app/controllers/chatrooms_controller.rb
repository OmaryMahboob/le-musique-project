class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.new
    @message = Message.new
    @messages = Message.all
  end

  def create
    @chatroom = Chatroom.create(chatroom_params)
    @chatroom.save
  end

  private

  def chatroom_params
    params.require(:chatroom).permit(:user1_id, :user2_id)
  end

end
