Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get  '/', to: 'sessions#new'
  get  '/signup', to: 'users#new'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  resources :users
  resources :schedules
  resources :workouts
end
