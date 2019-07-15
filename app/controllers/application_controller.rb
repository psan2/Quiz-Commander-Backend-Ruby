class ApplicationController < ActionController::API
  def issue_token(payload)
    debugger
    JWT.encode(payload, ENV['RAILS_SECRET'])
  end

  def decode_token(token)
    JWT.decode(token, ENV['RAILS_SECRET'])[0]
  end

  def get_token
    request.headers['Authorization']
  end

  def get_persona
    request.headers['Persona']
  end

  def current_user
    persona = get_persona
    token = get_token

    decoded_token = decode_token(token)

    if decoded_token.persona == 'host'
      user = Host.find(decoded_token['user_id'])
    elsif decoded_token.persona == 'team'
      user = Team.find(decoded_token['user_id'])
    end

    user_hash = { username: user[:username], id: user[:id] }
  end

  def logged_in
    !!current_user
  end
end
