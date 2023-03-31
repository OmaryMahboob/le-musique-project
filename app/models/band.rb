class Band < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :band_posts
  has_many :band_members

  validates :band_name, presence: true
  validates :style, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_band_name_and_style,
  against: [ :band_name, :style ],
  using: { tsearch: { prefix: true } }
=======

  has_many_attached :multimedia

end
