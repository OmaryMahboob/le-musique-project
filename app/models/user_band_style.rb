class UserBandStyle < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :style
  belongs_to :band, optional: true
  validates :style, uniqueness: { scope: :user }
end
