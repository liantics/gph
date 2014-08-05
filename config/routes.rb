Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :dashboards, only: [:index, :show, :new, :create]
  resources :projects, only: [:index]

  root "dashboards#index"
end
