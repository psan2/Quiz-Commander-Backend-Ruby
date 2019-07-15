class HostController < ApplicationController
  def create
    host = Host.find_by(username: params[:username])
    if host && host.authenticate(params[:password])
      payload = { host_id: host.id }
      token = issue_token(payload)
      render json: { jwt: token, username: host.username }
    else
      render json: { error: "The token couldn't be created. Login failed." }
    end
  end

  def show
    if logged_in
      render json: current_user
    else
      render json: { error: 'Incorrect token.' }
    end
  end
end
