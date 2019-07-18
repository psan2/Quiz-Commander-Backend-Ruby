class QuizzesController < ApplicationController
  before_action :require_host_login

  def index
    quizzes = Quiz.all.where(host_id: current_user['id'])
    render json: quizzes
  end

  def create
    quiz = Quiz.new(quiz_params)

    if quiz.valid?
      quiz.save
      render json: quiz
    else
      render json: quiz.errors.full_messages
    end
  end

  def show
    quiz = Quiz.find(params[:id])
    render json: QuizSerializer.new(quiz)
  end

  private

  def quiz_params
    params.require(:quiz).permit(:host_id, :quiz_type, :nickname)
  end
end
