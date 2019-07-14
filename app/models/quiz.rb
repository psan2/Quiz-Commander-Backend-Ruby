# frozen_string_literal: true

class Quiz < ApplicationRecord
  belongs_to :host
  has_many :quiz_nights
  has_many :quiz_rounds
  has_many :rounds, through: :quiz_rounds
  has_many :questions, through: :rounds
end
