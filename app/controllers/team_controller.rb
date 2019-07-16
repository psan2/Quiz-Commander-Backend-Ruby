class TeamController < ApplicationController
  def create
    team = Team.find_by(team_name: params[:team_name])
    if team && team.authenticate(params[:password])
      payload = { team_id: team.id, persona: 'team' }
      token = issue_token(payload)
      render json: { jwt: token, team_name: team.team_name }
    else
      render json: { error: "The token couldn't be created. Login failed." }
    end
  end

  def show
    if logged_in = 'team'
      render json: current_user
    else
      render json: { error: 'Incorrect token.' }
    end
  end
end
