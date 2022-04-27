Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      registrations: 'users/registrations',
      passwords: 'users/passwords',
      omniauth_callbacks: 'users/omniauth_callbacks'
      
    }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
    
  root 'static_pages#home'
  
  resources :users do
    member do
      get :following, :followers
    end
    collection do
      get :search
    end
  end
  resources :posts, only: %i(index new create show destroy) do
    resources :photos, only: %i(create)
    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
  resources :relationships, only: %i(create destroy)
  resources :chat_rooms, only: %i(create show)
end
