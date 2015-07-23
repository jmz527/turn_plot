Rails.application.routes.draw do

  # Root of the site
  root 'plots#index'

  # User routes made with devise
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Account routes, they dip into devise's user pool
  get 'register' => 'users/accounts#new'
  get 'login' => 'users/accounts#login'
  get 'user/:id' => 'users/accounts#user'
  get 'accounts' => 'users/accounts#index'
  get 'account' => 'users/accounts#account'

  # Registration route: creates new User + new Plot
  post 'register' => 'users/accounts#register'

  # Correspondent routes with nested Letter routes
  resources :correspondents do
    resources :letters do
      member do
        patch :has_read
      end
    end
  end

  # Plot routes
  resources :plots do
    member do
      # Activate this plot
      patch :activate
    end
  end

  # Coordinate and User Plot routes
  # get 'plot/:x' => 'plots#index'
  # get 'user/:id/plot' => 'plots#index'


end
