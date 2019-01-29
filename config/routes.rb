Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "sessions#new"
  get "/logout", to: "sessions#destroy", as: :logout
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :stocks, only: [:index, :new, :create, :show, :edit, :update, :destroy] 
  
  end
end
