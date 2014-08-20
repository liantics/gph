Rails.application.routes.draw do
  root "dashboards#index"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :charges, only: [:new, :create]
  resources :dashboards, only: [:index, :show, :new, :create]
  resources :projects, only: [:index, :new, :create, :show] do
    resources :levels, only: [:new, :create]
  end
    resources :levels, only: [:new, :create] do
      resources :donations, only: [:new, :create]
  end

  resources :categories, only: [:new, :create, :show, :edit, :update]
end
