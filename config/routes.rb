Rails.application.routes.draw do
  resources :market_place_partners
  resources :addresses
  devise_for :users, path: '', defaults: {format: :json}, path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'sessions',
  }

  resource :user, only: [:show, :update]
  get '/users', to: 'users#index', defaults: {format: :json}
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :order_items
  resources :orders
  resources :cart_items
  resources :carts
  resources :products
  default_url_options :host => "localhost:3000"

  root to: 'main#index'
end
