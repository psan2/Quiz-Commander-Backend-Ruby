class AnswersController < ApplicationController
  before_action :require_host_login
  # before_action :validate_ownership

  def create
    answer = Answer.new(answer_params)

    if answer.valid?
      answer.save
      render json: answer
    else
      render json: answer.errors.full_messages
    end
  end

  private

  def answer_params
    params.require(:answer).permit(
      :question_id,
      :answer_content,
      :correct_answer
    )
  end

  # def validate_ownership

  # end
end
