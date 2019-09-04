class QuizzesController < ApplicationController
  before_action :require_host_login
  before_action :get_quiz, only: %i[show update]
  @@rounds = { include: %i[rounds quiz_rounds] }

  def index
    quizzes = Quiz.all.where(host_id: current_user['id'])
    render json: QuizSerializer.new(quizzes, @@rounds)
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
    @quiz = Quiz.find(params[:id])
    render json: QuizSerializer.new(@quiz, @@all_children)
  end

  def update
    @quiz.update(nickname: params['quiz']['nickname'])

    @quiz.quiz_rounds.destroy_all
    params['quiz']['children'].each.with_index(1) do |child, index|
      QuizRound.create(round_id: child[:id], quiz: @quiz, index_in_quiz:index)
    end

    render json: QuizSerializer.new(@quiz, @@rounds)
  end

  def destroy
    Quiz.find(params[:id]).destroy
  end

  private

  def get_quiz
    @quiz = Quiz.find(params['id'])
  end

  def quiz_params
    params.require(:quiz).permit(:host_id, :quiz_type, :nickname)
  end
end
