class HostsController < ApplicationController
  before_action :require_host_login
  skip_before_action :require_host_login, only: %i[login create]

  def login
    host = Host.find_by(username: params[:username])
    if host && host.authenticate(params[:password])
      payload = { host_id: host.id, persona: 'hosts' }
      token = issue_token(payload)
      render json: { jwt: token, username: host.username }
    else
      render json: { error: "The token couldn't be created. Login failed." }
    end
  end

  def show
    if logged_in == 'host'
      render json: host_hash_maker
    else
      render json: { error: 'Incorrect token.' }
    end
  end

  def create
    host = Host.new(host_params)
    if host.valid?
      host.save
      token = issue_token({ host_id: host.id, persona: 'hosts' })
      render json: { jwt: token, username: host.username }
    else
      render json: { error: host.errors.full_messages }
    end
  end

  #TODO
  def update
    # host = current_user['host_id']
    # host.update(host_params)
  end

  def delete; end

  private

  def host_params
    params.require(:host).permit(
      :name,
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end

  def host_hash_maker(host = current_user)
    host_hash = { username: host[:username], id: host[:id], persona: 'hosts' }
  end
end
