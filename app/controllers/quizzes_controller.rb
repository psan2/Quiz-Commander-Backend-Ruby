class QuizzesController < ApplicationController
  before_action :require_host_login

  def index
    quizzes = Quiz.all.where(host_id: current_user['id'])
    options = { include: %i[rounds] }
    render json: QuizSerializer.new(quizzes, options)
  end

  def create
    quiz = Quiz.new(quiz_params)
    quiz.host = current_user

    if quiz.valid?
      quiz.save

      params['quiz']['rounds'].each do |round|
        QuizRound.create(round_id: round['id'], quiz: quiz)
      end

      render json: quiz
    else
      render json: quiz.errors.full_messages
    end
  end

  def show
    quiz = Quiz.find(params[:id])
    render json: QuizSerializer.new(quiz)
  end

  def destroy
    Quiz.find(params[:id]).destroy
    #build in feedback
  end

  private

  def quiz_params
    params.require(:quiz).permit(:host_id, :quiz_type, :nickname)
  end
end
