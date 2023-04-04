class Chatroom < ApplicationRecord
  belongs_to :User, class_name: "User", foreign_key: "user1_id"
  belongs_to :User, class_name: "User", foreign_key: "user2_id"
  validates :user1_id, uniqueness: { scope: :user2_id }
  has_many :messages, dependent: :destroy
end
