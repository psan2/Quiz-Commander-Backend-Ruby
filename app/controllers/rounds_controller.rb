class RoundsController < ApplicationController
  before_action :require_host_login
  before_action :get_round, only: %i[show update]
  def index
    rounds = Round.all.where(host_id: current_user['id'])
    options = { include: %i[questions] }
    render json: RoundSerializer.new(rounds, options)
  end

  def create
    round =
      Round.new(
        nickname: params['rounds']['nickname'],
        round_type: params['rounds']['round_type']
      )
    round.host = current_user
    if round.valid?
      round.save
      params['rounds']['questions'].each do |question|
        if question['question_content'] != ''
          RoundQuestion.create(question_id: question['id'], round: round)
        end
      end
      render json: round
    else
      render json: round.errors.full_messages
    end
  end

  def show
    options = { include: %i[questions] }
    round = Round.find(params[:id])
    render json: RoundSerializer.new(round, options)
  end

  def update
    round.nickname = params['rounds']['nickname']
    round.round_type = params['rounds']['round_type']

    round.round_questions.destroy_all
    params['rounds']['questions'].each do |question|
      RoundQuestion.create(question_id: question['id'], round: round)
    end

    render json: RoundSerializer.new(round, options)
  end

  def destroy
    round = Round.find(params['id'])
    round.round_questions.destroy_all
    round.destroy
  end

  private

  def round_params
    params.require(:round).permit(:host_id, :round_type, :nickname)
  end

  def get_round
    round = Round.find(params['rounds']['id'])
  end
end
