Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  get 'items/search'
  resources :items do 
    resources :purchases, only: [:new, :create, :index]
  end
end
