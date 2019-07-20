# frozen_string_literal: true

class Answer < ApplicationRecord
  validates :answer_content, presence: true

  has_many :team_answers
  belongs_to :question
end
