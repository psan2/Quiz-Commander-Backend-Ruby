# frozen_string_literal: true

class QuizNight < ApplicationRecord
  belongs_to :quiz

  has_many :participations

end
