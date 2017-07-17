Rails.application.routes.draw do
  root 'static_pages#root'
  devise_for :users
  resources  :users
  resources  :stores do
    resources :products
  end
  resources :ordered_products, only: [:create, :destroy]
<<<<<<< HEAD
=======
  resources :carts
>>>>>>> 8b2ebea89aa41a726da4f09a4cca6763c0bea2f2
end
