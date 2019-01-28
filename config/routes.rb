Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :new, :create, :show, :edit, :destroy] do
    resources :stocks, only: [:index, :new, :create, :show, :edit, :destroy] 
  
  end
end
