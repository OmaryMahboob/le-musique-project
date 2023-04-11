class User::BandStyle < ApplicationRecord
  belongs_to :user
  belongs_to :style
  belongs_to :band
end
