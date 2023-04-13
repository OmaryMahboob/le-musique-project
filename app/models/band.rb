class Band < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :band_members, dependent: :destroy
  has_many :users, through: :band_members
  has_many :user_band_styles, dependent: :destroy
  has_many :styles, through: :user_band_styles
  has_many_attached :multimedia
  # validates :name, uniqueness: true, presence: true
end
