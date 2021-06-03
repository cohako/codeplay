Rails.application.routes.draw do
  root to: "home#index"

  devise_for :users
  
  devise_scope :user do
    get 'user', to: "user#show"
    get "signin", to: "devise/sessions#new", as: "signin"
  end

  resources :users do
    resources :profiles
  end

  resources :courses do

    resources :lessons
    
    post 'enroll', on: :member
    get 'enrolled', on: :collection
  end

  resources :instructors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end