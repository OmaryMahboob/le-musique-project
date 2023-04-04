class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bands, through: :band_members
  has_many :band_members
  has_many :chatrooms, foreign_key: :user1_id
  has_many :chatrooms, foreign_key: :user2_id
  has_many :messages
  has_one_attached :profile_picture
  has_many_attached :multimedia

end
