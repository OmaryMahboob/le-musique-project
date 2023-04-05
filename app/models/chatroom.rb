require 'pry-byebug'
class Chatroom < ApplicationRecord
  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :receiver, class_name: "User", foreign_key: :receiver_id
  validates :sender, uniqueness: { scope: :receiver }
  validates :receiver, uniqueness: { scope: :sender }
  has_many :messages, dependent: :destroy

  def self.find_chat_room(current_user, other_user)
    chatroom = Chatroom.where(sender: current_user).find_by(receiver: other_user)
    chatroom ||= Chatroom.where(sender: other_user).find_by(receiver: current_user)
    chatroom
  end

end
