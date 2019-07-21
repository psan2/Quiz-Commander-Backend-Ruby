class Question < ApplicationRecord
  validate :question_must_have_at_least_one_correct_answer
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
        end
    end
  end

  # private

  # def question_must_have_at_least_one_correct_answer
  #   correct_answer_exists = false
  #   this.answers.each

  #     errors.add("Question must have at least one correct answer")
  #   end
  # end
end
