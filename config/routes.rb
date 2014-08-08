Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :dashboards, only: [:index, :show, :new, :create]
  resources :projects, only: [:index, :new, :create, :show]
  resources :categories, only: [:new, :create, :show, :edit, :update]

  root "dashboards#index"
end
