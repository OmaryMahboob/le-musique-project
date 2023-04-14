class Style < ApplicationRecord
  has_many :user_band_styles, dependent: :destroy
  has_many :bands, through: :user_band_styles
  has_many :users, through: :user_band_styles
  validates :style, presence: true, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_style,
  against: [ :style],
  using: { tsearch: { prefix: true } }
end
