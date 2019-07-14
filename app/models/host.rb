# frozen_string_literal: true

class Host < ApplicationRecord
  has_secure_password

  has_many :questions
  has_many :rounds
  has_many :quizzes

  has_many :round_questions, through: :rounds
  has_many :quiz_rounds, through: :quizzes
  has_many :quiz_nights, through: :quizzes
end
