class QuizRoundsController < ApplicationController
  before_action :require_host_login

  def create
    new_quiz_round =
      QuizRound.create(
        round_id: params[:quiz_round][:round_id],
        question_id: params[:quiz_round][:quiz_id]
      )

    if new_quiz_round.errors
      render json: new_quiz_round.errors.full_messages
    else
      render json: new_quiz_round
    end
  end

  def destroy
    QuizRound.find(params[:id]).destroy
    #build in feedback
  end
end
