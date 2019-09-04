# frozen_string_literal: true

class Quiz < ApplicationRecord
  before_destroy :destroy_associated_records

  belongs_to :host
  has_many :quiz_nights
  has_many :quiz_rounds
  has_many :rounds, through: :quiz_rounds
  has_many :questions, through: :rounds
  has_many :answers, through: :questions

  private

  def destroy_associated_records
    self.quiz_nights.destroy_all
    self.quiz_rounds.destroy_all
  end
end
