class Band < ApplicationRecord
  has_many_attached :photos
  belongs_to :user
  has_many :band_posts
  has_many :band_members
end
