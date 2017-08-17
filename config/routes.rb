Rails.application.routes.draw do
  root 'static_pages#root'
  
  devise_for :users
  resources  :users
  
  resources  :stores do
    resources :products  	
  end

  resources :carts, only: [:create]
  get :delete_cart, to: "carts#delete_cart"
  
  resources :orders, only: [:create, :show]
end
