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
  get :recipient_adress, to: "orders#recipient_adress"
  post :pre_order, to: "orders#pre_order"
end