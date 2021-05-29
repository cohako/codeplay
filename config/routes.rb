Rails.application.routes.draw do

  devise_for :users
  
  devise_scope :user do
    get "signin", to: "devise/sessions#new", as: "signin"
  end
  root to: "home#index"

  resources :courses do
    resources :lessons
  end

  resources :instructors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end