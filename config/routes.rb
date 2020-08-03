Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'

  resources :users, only: [:index, :new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :goals, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :goal_comments, only: [:create, :destroy]
end
