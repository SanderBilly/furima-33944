Rails.application.routes.draw do
  devise_for :users

  root to: "items#index"
  get "items/category/:category_id", to: "items#category"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :marks, only: [:create, :destroy]
    resources :comments, only: [:create]
    collection do
      get 'search'
    end
  end
end