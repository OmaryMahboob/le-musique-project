class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  has_many :bands
  has_many :band_members
  has_many :chatroom_senders, class_name: "Chatroom", foreign_key: :sender
  has_many :chatroom_receivers, class_name: "Chatroom", foreign_key: :recever
  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills
  has_many :user_band_styles, dependent: :destroy
  has_many :styles, through: :user_band_styles

  # validates :full_name, presence: true
  # validates :nickname, presence: true

  # validates :nickname, length: { minimum: 3, maximum: 20 }, allow_blank: true

  # validates :description, length: { maximum: 200 }

  validates :email, uniqueness: true
  # validates :nickname, uniqueness: true

  has_one_attached :profile_picture
  has_many_attached :multimedia

  EXPERIENCE = ["Less than 6 months", "Between 6 months to 1 year", "Between 1 to 2 years",
                "Between 2 years to 5 years", "More than 5 years"]

  include PgSearch::Model
  pg_search_scope :search_by_full_name_and_nickname,
                  against: [ :full_name, :nickname ],
                  using: { tsearch: { prefix: true } }
end
