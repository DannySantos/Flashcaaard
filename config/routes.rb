Rails.application.routes.draw do
  get 'flashcards/new'

  root to: 'application#index'
  devise_for :users
  resources :flashcards
  resources :card_sets
  resources :tags, only: [:show, :index] do
    collection do
      get 'autocomplete'
    end
  end
end
