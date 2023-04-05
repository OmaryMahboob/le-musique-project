class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.where(user1_id: current_user.id)
    @user = current_user
    @user.chatrooms = @chatrooms
  end

  def show

    @chatroom = Chatroom.where(user1_id: current_user.id, user2_id: params[:id]).first
    @user = current_user
    @user1 = User.find(current_user.id)
    @user2 = User.find(params[:id])
    @chatroom_name = @user == @user1 ? "#{@user2.full_name} (#{@user2.nickname})" : "#{@user1.full_name} (#{@user1.nickname})"
    @message = Message.new

  end

  def create
    @chatroom = Chatroom.new
    @user1 = current_user
    @user2 = User.find(params[:user2_id])
    @chatroom.user1_id = @user1.id
    @chatroom.user2_id = @user2.id
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      puts "error"
    end
  end
end
