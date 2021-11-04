Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'events#index'
  resources :events, only: [:index, :new, :create, :destroy]
  resources :comments, only: [:create, :edit, :update, :destroy]
end
