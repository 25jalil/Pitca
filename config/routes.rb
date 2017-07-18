Rails.application.routes.draw do
  root 'static_pages#root'
  devise_for :users
  resources  :users
  resources  :stores do
    resources :products  	
  end
  post 'virtual_cart', to: 'products#virtual_cart'
  get 'destroy_cart', to: 'products#destroy_cart'
end
