class Round < ApplicationRecord
  belongs_to :host
  has_many :quiz_rounds
  has_many :round_questions
  has_many :questions, through: :round_questions

end
