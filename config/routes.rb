Rails.application.routes.draw do
  resources :carts do
    member do
      post :pay
    end
  end
  resources :line_items
  resources :authors
  resources :themes
  resources :publishers
  resources :books do
    member do
      get :download_pdf
      
    end
  end
  devise_for :users

  get 'partials/about'

  root "books#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
  