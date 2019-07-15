class ApplicationController < ActionController::API
  def issue_token(payload)
    JWT.encode(payload, ENV['RAILS_SECRET'])
  end

  def decode_token(token)
    JWT.decode(token, ENV['RAILS_SECRET'])[0]
  end
end
