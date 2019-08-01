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
      params['quiz']['child_ids'].each do |id|
        QuizRound.create(round_id: id, quiz: quiz)
      end

      render json: quiz
    else
      render json: quiz.errors.full_messages
    end
  end

  def show
    options = { include: %i[rounds] }
    quiz = Quiz.find(params[:id])
    render json: QuizSerializer.new(quiz, options)
  end

  def update
    quiz = Quiz.find(params['quiz']['id'])
    quiz['nickname'] = params['quiz']['nickname']

    quiz.quiz_rounds.destroy_all
    params['quiz']['child_ids'].each do |round_id|
      qz = QuizRound.create(round_id: round_id, quiz: quiz)
    end

    options = { include: %i[rounds] }
    render json: QuizSerializer.new(quiz, options)
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
