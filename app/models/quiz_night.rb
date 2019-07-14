# frozen_string_literal: true

class QuizNight < ApplicationRecord
  belongs_to :quiz

  has_one :winning_team, class_name: :Team

  has_many :participations

end
