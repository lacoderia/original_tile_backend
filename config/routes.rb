Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  mount_devise_token_auth_for 'User', at: 'auth', :controllers => {:registrations => "registrations", :sessions => "sessions", :passwords => "passwords"}, defaults: { format: :json }
  
  devise_scope :user do
    match 'users/sign_up', :to => "registrations#create", :via => [:post, :options]
    match 'users/sign_in', :to => "sessions#create", :via => [:post, :options]
    match 'users/password', :to => "passwords#create", :via => [:post, :options]
    get 'logout', :to => "sessions#destroy"
    get 'session', :to => "sessions#get"
    match 'auth/password', :to => "passwords#update", :via => [:put, :options]
  end
  

  resources :colors

  resources :tiles do
    collection do
      get 'tile_types', :to => 'tiles#tile_types'
      get 'by_tile_type', :to => 'tiles#by_tile_type'
    end
  end
  resources :projects do
    collection do
      get 'by_user', :to => 'projects#by_user'
    end
  end
  resources :roles
  resources :users

  root to: "admin/dashboard#index"  
  
end
