Rails.application.routes.draw do

  root 'users#new'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  resources :favorites, only: [:create, :destroy]

  resources :sessions, only: [:new, :create, :destroy]

  resources :users, except: [:destroy]
  get "users/:id/favorites", to: "users#favorites"

  resources :pictures do
    collection do
      post :confirm
    end
  end
end
