Rails.application.routes.draw do

  root "home#index"

  devise_scope :user do
    authenticated :user do
      root 'ideas#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#index', as: :unauthenticated_root
    end
  end

  #get '/about', to: 'home#about'
  
  resources :ideas  do 
    member do
      put "like", to: "ideas#upvote"
    end
  end
  
  resources :companies, except: [:index]
  devise_for :users
  resources :users, only: [:index, :show]
  resources :comments, only: [:create, :destroy, :show]

end