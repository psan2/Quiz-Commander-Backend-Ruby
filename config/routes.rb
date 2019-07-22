Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  post 'teams/login', to: 'teams#login'
  post 'hosts/login', to: 'hosts#login'

  resources :hosts, only: %i[show create update destroy]
  resources :questions
  resources :round_questions, only: %i[create destroy]
  resources :rounds
  resources :quiz_rounds, only: %i[create destroy]
  resources :quizzes
  resources :answers, only: %i[create update destroy]

  resources :teams, only: %i[show create update destroy]
  resources :quiz_nights, only: %i[show create destroy]
  resources :team_answers, only: %i[create destroy]
  resources :participations, only: %i[create update destroy]
end
