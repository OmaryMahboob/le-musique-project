class Skill < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills
  validates :skill, presence: true, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_skill,
  against: [ :skill],
  using: { tsearch: { prefix: true } }
end
