Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/capture', to: 'pokemons#capture', as: 'capture'
  patch '/damage', to: 'pokemons#damage', as: 'damage'
  get '/new_pokemon', to: 'pokemons#new', as: 'new_pokemon'
  post '/create_pokemon', to: 'pokemons#create', as: 'create_pokemon'
end
