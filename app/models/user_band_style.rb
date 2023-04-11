class UserBandStyle < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :band, optional: true
  belongs_to :style
  # validates :style_id, uniqueness: { scope: :user_id }
end
