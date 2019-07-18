class Team < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :team_name, presence: true, uniqueness: true
  validates :password, presence: true, length: { within: 6..40 }, on: :create

  has_many :participations
  has_many :team_answers, through: :participations
  has_many :quiz_nights, through: :participations
  has_many :answers, through: :team_answers
end
