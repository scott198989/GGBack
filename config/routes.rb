Rails.application.routes.draw do
  # Set the root to whichever controller#action you want for the landing page
  root 'home#index'
  
  # CRUD operations for users
  resources :users
  
  # Services with nested resources for reviews and images
  resources :services do
    resources :reviews, only: [:create, :destroy]
    resources :images, only: [:create, :destroy, :index]
  end

  # CRUD operations for appointments with nested resources for payments
  resources :appointments do
    resources :payments, only: [:new, :create, :show]
  end

  # Custom route for listing all appointments for a user
  get '/my_appointments', to: 'appointments#user_index', as: 'user_appointments'

  # Routes for user authentication (ensure you do not duplicate these)
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  # Routes for a contact form
  get '/contact', to: 'contact#new', as: 'new_contact'
  post '/contact', to: 'contact#create', as: 'create_contact'
  
  # Static page routes
  get '/about', to: 'static_pages#about'
  # Add other static pages as needed
end

