Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :tours
    resources :categories do
      resources :priorities, only: [:update]
    end
  end

  devise_for :admins
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  authenticated :admin_user do
    root to: "admin#index", as: :admin_root
  end
  
  get 'admin' => "admin#index", as: :admin
  get 'admin/banner' => "admin#banner", as: :admin_banner
  post 'admin/save_banner' => "admin#save_banner", as: :admin_save_banner
  patch 'admin/save_banner' => "admin#save_banner", as: :admin_update_banner
  get "about" => "home#about", as: :about
  get "tour/:id" => "home#tour", as: :tour
  get "category(/:id)" => "home#category", as: :category
  get "search" => "home#search", as: :search
  # Defines the root path route ("/")
  root "home#index"
end
