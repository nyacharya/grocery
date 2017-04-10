Rails.application.routes.draw do
  resources :categories

  
  
  devise_for :users, controllers: {registrations: 'registrations'}
  # devise_scope :users do
  #   get "user/:id/edit" => "registrations#editprofile"
  # end 
  # get 'user/:id', to: 'registrations#showprofile', as:'show_user'
  # get 'user/:id/edit', to: 'registrations#editprofile', as:'edit_user'
  resources :products
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"
  # root "welcomes#index"
  get 'category/:id', to: 'products#showproducts', as: 'cat'
  get 'category', to: 'categories#testing', as: 'testcat'
  #get 'buy/:id', to: 'categories#buy', as:'buy'
  get 'purchase', to: 'purchases#index', as:'purchase'
  get 'user/:id', to: 'purchases#showprofile', as:'show_user'
  get 'user/:id/edit', to: 'purchases#editprofile', as:'edit_user'
  get 'allproducts', to: 'products#show_all_products', as:'all_products'
  # put 'user/:id', to: 'purchases#update'
  patch 'user/:id', to: 'purchases#update'
  get 'success/:id', to: 'products#success', as:'success'
  resources :charges
  
end
