class RoundsController < ApplicationController
  before_action :require_host_login

  def index
    rounds = Round.all.where(host_id: current_user['id'])
    options = { include: %i[questions] }
    render json: RoundSerializer.new(rounds, options)
  end

  def create
    round = Round.new(round_params)

    if round.valid?
      round.save
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

  private

  def round_params
    params.require(:round).permit(:host_id, :round_type, :nickname)
  end
end
