Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      resources :teams, only: %i[index create]
      resources :hosts, only: %i[index create]
    end
  end

  post '/team/create', to: 'team#create'
  get '/team/show', to: 'team#show'
  post '/host/create', to: 'host#create'
  get '/host/show', to: 'host#show'

  resources :questions
end
