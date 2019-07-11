class QuizNight < ApplicationRecord
  belongs_to :quiz
  belongs_to :winner
end
