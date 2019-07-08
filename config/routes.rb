Rails.application.routes.draw do
  resources :users
  resources :games

  get '/socket/:id', to: 'games#socket'
  get '/games/user/:id', to: 'games#getUserGames'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
