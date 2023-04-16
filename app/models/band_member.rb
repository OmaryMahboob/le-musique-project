class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :user
  validates :user_id, uniqueness: { scope: :band_id }
  validates :band_id, uniqueness: { scope: :user_id }
end
