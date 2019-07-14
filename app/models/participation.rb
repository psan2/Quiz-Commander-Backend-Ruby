# frozen_string_literal: true

class Participation < ApplicationRecord
  belongs_to :team
  belongs_to :quiz_night
  has_many :team_answers
  has_many :answers, through: :team_answers
end
