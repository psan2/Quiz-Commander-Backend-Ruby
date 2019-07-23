class QuestionsController < ApplicationController
  before_action :require_host_login
  before_action :get_question, only: %i[show update delete]

  def index
    questions = Question.all.where(host_id: current_user['id'])
    options = { include: %i[answers] }
    render json: QuestionSerializer.new(questions, options)
  end

  def create
    new_question_params = question_params
    new_question_params['host_id'] = current_user.id
    question = Question.new(new_question_params)
    if question.valid?
      question.save
      answer_params =
        params[:question][:answers].map do |answer|
          {
            answer_content: answer[:answer_content],
            correct_answer: answer[:correct_answer]
          }
        end
      answer_params.each { |answer| question.answers.create(answer) }
      render json: question
    else
      render json: question.errors.full_messages
    end
  end

  def show
    options = { include: %i[answers] }
    render json: QuestionSerializer.new(question, options)
  end

  def update
    question.update(question_params)

    question.answers.destroy_all

    answer_params =
      params[:question][:answers].map do |answer|
        {
          answer_content: answer[:answer_content],
          correct_answer: answer[:correct_answer]
        }
      end
    answer_params.each { |answer| question.answers.create(answer) }

    options = { include: %i[answers] }
    render json: QuestionSerializer.new(question, options)
  end

  def destroy
    question.destroy
    #build in feedback
  end

  private

  def get_question
    question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(
      :question_type,
      :question_content,
      :aux_content_url,
      :nickname
    )
  end
end
