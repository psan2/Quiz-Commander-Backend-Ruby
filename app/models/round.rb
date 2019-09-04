class Round < ApplicationRecord
  before_destroy :destroy_associated_records

  belongs_to :host
  has_many :quiz_rounds
  has_many :round_questions
  has_many :questions, through: :round_questions

  private

  def destroy_associated_records
    self.round_questions.destroy_all
  end
end
