Rails.application.routes.draw do
  get 'flashcards/new'

  root to: 'application#index'
  devise_for :users
  resources :flashcards, only: [:new, :create, :show]
end
