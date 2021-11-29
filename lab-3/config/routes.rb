Rails.application.routes.draw do

  devise_for :users
  get '/courses/sync', to: 'courses#sync'
  get '/courses/show_section/:id', to: 'courses#show_section'
  get '/courses/index', to: 'courses#index'
  resources :courses

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
