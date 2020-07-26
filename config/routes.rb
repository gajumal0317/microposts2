Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'
  
  resources :users, only: [:index, :show, :new, :create] do 
    #user controllerで定義するアクション
    member do
      get :followings
      get :followers
      get :likes
    end
  end
  #それぞれのcontrollerで定義するアクション
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end