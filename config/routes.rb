Rails.application.routes.draw do
  
  get 'messages/index'
  get 'conversations/index'
  devise_for :users
  root 'posts#index'
  resources :posts do
    resources :participations
  end
  resources :categories
  resources :team, only: [:index] 
  resources :users do
    member do
      put "like" => "users#upvote"
      put "unlike" => "users#downvote"
    end
  end

  resources :users
	  scope 'admin', module: 'admin', as: 'admin' do
    resources :landing, only: [:index]
    resources :users, only: [:index, :edit, :update, :destroy]
    resources :posts, only: [:create, :index, :edit, :update, :destroy]
    root 'landing#index'
  end
    
  
  resources :cgu, only: [:index]
  resources :privacy, only: [:index]
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
