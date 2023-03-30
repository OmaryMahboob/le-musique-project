class Band < ApplicationRecord
  has_many :band_members
  has_many_attached :photos
end
