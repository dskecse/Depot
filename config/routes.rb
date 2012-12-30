Depot2::Application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show]
  resources :payment_types
  resources :orders
  resources :line_items
  resources :carts

  get 'store/index'

  resources :products do
    get :who_bought, on: :member
  end

  match 'line_items/:id/decrement' => 'line_items#decrement', method: :post, as: :decrement

  root to: 'store#index'
end
