class QuestionsController < ApplicationController
  def show
    question = Question.find(params[:id])
    render json: QuestionSerializer.new(question)
  end

end
