class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bands, through: :band_members
  has_many :band_members
  has_many :chatroom_senders, class_name: "Chatroom", foreign_key: :sender
  has_many :chatroom_receivers, class_name: "Chatroom", foreign_key: :recever
  has_one_attached :profile_picture
  has_many_attached :multimedia

end
