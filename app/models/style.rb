class Style < ApplicationRecord
  has_many :user_band_styles
  has_many :bands, through: :user_band_styles, optional: true
  has_many :users, through: :user_band_styles, optional: true
  validates :name, presence: true, uniqueness: true
end
