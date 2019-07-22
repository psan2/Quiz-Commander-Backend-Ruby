class RoundQuestionsController < ApplicationController
  before_action :require_host_login

  def create
    new_round_question =
      RoundQuestion.create(
        round_id: params[:round_question][:round_id],
        question_id: params[:round_question][:question_id]
      )

    if new_round_question.errors
      render json: new_round_question.errors.full_messages
    else
      render json: new_round_question
    end
  end

  def destroy
    RoundQuestion.find(params[:id]).destroy
    #build in feedback
  end
end
