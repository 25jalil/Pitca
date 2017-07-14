Rails.application.routes.draw do
  root 'static_pages#root'
  devise_for :users
  resources :users
  resources :stores do
    resources :products
  end
  resources :ordered_products, only: [:create]
end
