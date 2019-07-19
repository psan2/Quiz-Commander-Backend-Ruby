class QuestionsController < ApplicationController
  before_action :require_host_login

  def index
    questions = Question.all.where(host_id: current_user['id'])
    options = { include: %i[answers] }
    render json: QuestionSerializer.new(questions, options)
  end

  def create
    question = Question.new(question_params)

    if question.valid?
      question.save
      render json: question
    else
      render json: question.errors.full_messages
    end
  end

  def show
    question = Question.find(params[:id])
    options = { include: %i[answers] }
    render json: QuestionSerializer.new(question, options)
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
    options = { include: %i[answers] }
    render json: QuestionSerializer.new(question, options)
  end

  private

  def question_params
    params.require(:question).permit(
      :question_type,
      :question_content,
      :aux_content_url,
      :nickname,
      answers: %i[question_id answer_content correct_answer id]
    )
  end
end
