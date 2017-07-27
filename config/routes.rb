Rails.application.routes.draw do
  root 'static_pages#root'
  
  devise_for :users
  resources  :users
  
  resources  :stores do
    resources :products  	
  end

  resources :orders, only: [:create, :show]

  post 'session_cart', to: 'carts#session_cart'
  get 'destroy_cart',  to: 'carts#destroy_cart'
end
