class RoundsController < ApplicationController
  before_action :require_host_login
  before_action :get_round, only: %i[show update]
  @@questions = { include: %i[questions] }

  def index
    @rounds = Round.all.where(host_id: current_user['id'])
    render json: RoundSerializer.new(@rounds, @@questions)
  end

  def create
    new_round =
      Round.new(
        nickname: params['rounds']['nickname'],
        round_type: params['rounds']['round_type']
      )
    new_round.host = current_user
    if new_round.valid?
      new_round.save
      params['rounds']['child_ids'].each do |id|
        RoundQuestion.create(question_id: id, round: new_round)
      end
      render json: new_round
    else
      render json: new_round.errors.full_messages
    end
  end

  def show
    render json: RoundSerializer.new(@round, @@questions)
  end

  def update
    @round.update(
      nickname: params['rounds']['nickname'],
      round_type: params['rounds']['round_type']
    )

    @round.round_questions.destroy_all
    params['rounds']['child_ids'].each do |id|
      RoundQuestion.create(question_id: id, round: @round)
    end

    render json: RoundSerializer.new(@round, @@questions)
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
    @round = Round.find(params['rounds']['id'])
  end
end
