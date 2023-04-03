# class ChatroomsController < ApplicationController
#   def show
#     @chatroom = Chatroom.find(params[:id])
#     @message = Message.new
#     # @chatroom.messages = @chatroom.where(chatroom_id: @chatroom.id)
#   end

#   def create
#     @chatroom = Chatroom.new(chatroom_params)
#     @chatroom.save
#   end

#   private

#   def chatroom_params
#     params.require(:chatroom).permit(:user1_id, :user2_id)
#   end

# end

class ChatroomsController < ApplicationController
  def index
    @room = Chatroom.new
    @rooms = Chatroom.all

    @users = User.all
    render 'index'
  end

  def show
    @single_room = Room.find(params[:id])

    @room = Room.new
    @rooms = Room.public_rooms

    @message = Message.new
    @messages = @single_room.messages.order(created_at: :asc)

    @users = User.all
    render 'index'
  end

  def create
    @room = Room.create(name: params['room']['name'])
  end
end
