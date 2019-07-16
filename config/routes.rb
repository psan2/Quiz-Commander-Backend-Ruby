Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  post 'teams/login', to: 'teams#login'
  post 'hosts/login', to: 'hosts#login'

  resources :hosts, only: %i[show create update delete]
  resources :questions
  resources :round_questions, only: %i[create delete]
  resources :rounds, only: %i[show create delete]
  resources :quiz_rounds, only: %i[create delete]
  resources :quizzes, only: %i[show create update delete]
  resources :answers, only: %i[create update delete]

  resources :teams, only: %i[show create update delete]
  resources :quiz_nights, only: %i[show create delete]
  resources :team_answers, only: %i[create delete]
  resources :participations, only: %i[create update delete]
end
