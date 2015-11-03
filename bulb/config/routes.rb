Rails.application.routes.draw do

  devise_scope :user do
      authenticated :user do
        root 'ideas#index', as: :authenticated_root
      end

      unauthenticated do
        root 'home#index', as: :unauthenticated_root
      end
    end
get '/about', to: 'home#about'
  resources :ideas
  resources :companies
  devise_for :users
  resources :users, only: [:index, :show]
  resources :comments, only: [:create, :destroy]
  
end