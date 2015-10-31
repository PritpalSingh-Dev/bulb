Rails.application.routes.draw do

  root "ideas#index"
  resources :ideas
  resources :companies
  devise_for :users
  resources :users, only: [:index, :show]

  
end