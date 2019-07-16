class ApplicationController < ActionController::API
  def issue_token(payload)
    JWT.encode(payload, ENV['RAILS_SECRET'])
  end

  def decode_token(token)
    JWT.decode(token, ENV['RAILS_SECRET'])[0]
  rescue JWT::DecodeError
    false
  end

  def get_token
    request.headers['Authorization']
  end

  def get_persona
    request.headers['Persona']
  end

  def logged_in
    user = current_user
    !!user ? user.class.name.downcase : false
  end

  def current_user
    token = get_token
    persona = get_persona
    decoded_token = decode_token(token)
    if !!decoded_token == true
      if decoded_token['persona'] == 'host'
        Host.find(decoded_token['host_id'])
      elsif decoded_token['persona'] == 'team'
        Team.find(decoded_token['team_id'])
      end
    else
      false
    end
  end

  def require_host_login
    unless logged_in == 'host'
      render json: { error: 'Must be logged in on a host account.' }
    end
    @host = current_user
  end

  def require_team_login
    unless logged_in == 'team'
      render json: { error: 'Must be logged in on a team account.' }
    end
    @team = current_user
  end
end
