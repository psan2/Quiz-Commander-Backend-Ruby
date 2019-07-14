class Team < ApplicationRecord
  has_many :participations
  has_many :team_answers, through: :participations
  has_many :quiz_nights, through: :participations
  has_many :answers, through: :team_answers

end
