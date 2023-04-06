class ChatroomsController < ApplicationController
  def index
    @user_chatrooms = Chatroom.where(sender: current_user).or(Chatroom.where(receiver: current_user))
    @user = current_user
  end

  def show
    @user_chatrooms = Chatroom.where(sender: current_user).or(Chatroom.where(receiver: current_user))

    @chatroom = Chatroom.find(params[:id])
    #@receiver = User.find(params[:id])
    @chatroom_name = @chatroom.sender == current_user ? @chatroom.receiver.full_name : @chatroom.sender.full_name
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    @receiver = User.find(params[:receiver])
    @chatroom.sender = current_user
    @chatroom.receiver = @receiver
    redirect_to chatroom_path(@chatroom) if @chatroom.save!
  end
end
