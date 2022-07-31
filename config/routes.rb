Rails.application.routes.draw do
  resources :bets, only: %i[index update]
  resources :statistics, only: %i[index]

  root 'bets#index'

  mount Sidekiq::Web => '/sidekiq'
end
