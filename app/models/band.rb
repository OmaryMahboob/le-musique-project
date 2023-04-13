class Band < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :band_members, dependent: :destroy
  has_many :users, through: :band_members
  has_many :user_band_styles, dependent: :destroy
  has_many :styles, through: :user_band_styles
  has_many_attached :multimedia
  validates :band_name, uniqueness: true, presence: true
  
  include PgSearch::Model
  pg_search_scope :search_by_band_name_and_style,
  against: [ :band_name, :style ],
  using: { tsearch: { prefix: true } }
end
