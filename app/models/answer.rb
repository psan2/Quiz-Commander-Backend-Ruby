# frozen_string_literal: true

class Answer < ApplicationRecord
  #using has_many to allow some Answers to not be in the Correct_Answers table
  has_many :correct_answers

  has_many :team_answers
  belongs_to :question
end
