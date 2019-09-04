require './app/demo_creation.rb'

class HostsController < ApplicationController
  include DemoCreation
  before_action :require_host_login
  skip_before_action :require_host_login, only: %i[login create]

  def login
    host = Host.find_by(username: params[:username])
    if host && host.authenticate(params[:password])

      #this side-track generates a clean demo instance for visitors who want to try the site without signing up
      # temporarily disabled due to latency
      # if host[:username] == "demo"
      #   host = clean_demo()
      # end

      payload = { host_id: host.id, persona: 'hosts' }
      token = issue_token(payload)
      render json: { jwt: token, username: host.username }
    else
      render json: { error: "Sorry, something wasn't quite right. Please try again." }
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
