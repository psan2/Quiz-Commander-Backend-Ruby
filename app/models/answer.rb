# frozen_string_literal: true

class Answer < ApplicationRecord
  has_many :team_answers
  belongs_to :question
end
