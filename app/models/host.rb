# frozen_string_literal: true

class Host < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  validates :password,
            presence: true,
            confirmation: true,
            length: { within: 6..40 },
            on: :create

  has_many :questions
  has_many :rounds
  has_many :quizzes

  has_many :round_questions, through: :rounds
  has_many :quiz_rounds, through: :quizzes
  has_many :quiz_nights, through: :quizzes
end
