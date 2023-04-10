class UserBandStyle < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :style, optional: true
  belongs_to :band

  private
  def user_or_band_present
    unless user.present? || band.present?
      errors.add(:base, "User or Band must be present")
    end
  end
end
