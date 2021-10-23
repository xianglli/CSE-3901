Rails.application.routes.draw do

  get '/courses/sync', to: 'courses#sync'
  resources :courses

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
