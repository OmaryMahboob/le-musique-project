class Band < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :band_posts
  has_many :band_members
  has_many :users, through: :band_members

  has_many_attached :multimedia
end
