class Question < ApplicationRecord
  belongs_to :host
  has_many :answers
  has_many :round_questions
  has_many :rounds, through: :round_questions
  has_many :quizzes, through: :round_questions

  
end
