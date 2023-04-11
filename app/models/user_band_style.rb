class UserBandStyle < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :band, optional: true
  belongs_to :style
  validates :style_id, uniqueness: { scope: :band_id }
end
