Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  devise_for :users
  root to: "items#index"
  get 'items/search'
  resources :items,  shallow: true do 
    resources :purchases, only: [:new, :create, :index]
  end
end
