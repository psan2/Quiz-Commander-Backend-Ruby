class Question < ApplicationRecord
  belongs_to :host
  has_many :answers
  has_many :round_questions
  has_many :rounds, through: :round_questions
  has_many :quizzes, through: :round_questions

  def answers=(answersArray)
    answersArray.each do |answer|
      target =
        Answer.find_or_create_by(id: answer.id) do |newAnswer|
          newAnswer = answer
          debugger
        end
      debugger
    end
  end
end
