Depot2::Application.routes.draw do
  devise_for :users

  scope '(:locale)' do
    resources :users, only: [:index, :show]
    resources :payment_types
    resources :orders
    resources :line_items
    resources :carts

    resources :products do
      get :who_bought, on: :member
    end

    match 'line_items/:id/decrement' => 'line_items#decrement', method: :post, as: :decrement

    root to: 'store#index'
  end
end
