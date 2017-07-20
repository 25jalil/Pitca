Rails.application.routes.draw do
  root 'static_pages#root'
  
  devise_for :users
  resources  :users
  resources  :stores do
    resources :products  	
  end
  resources :orders, only: [:create, :show]
  post 'virtual_cart', to: 'products#virtual_cart'
  get 'destroy_cart', to: 'products#destroy_cart'
  get 'order_user', to: 'orders#order_user'
end
