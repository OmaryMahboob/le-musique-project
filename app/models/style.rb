class Style < ApplicationRecord
  has_many :user_band_styles, dependent: :destroy
  has_many :bands, through: :user_band_styles
  has_many :users, through: :user_band_styles
  validates :style, presence: true, uniqueness: true
end
