class Skill < ApplicationRecord
  has_many :user_skills, dependent: :destroy
  has_many :users, through: :user_skills
  validates :skill, presence: true, uniqueness: true
end
