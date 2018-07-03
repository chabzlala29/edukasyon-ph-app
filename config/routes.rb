Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :courses, only: [:index, :show] do
    resources :teachers, only: [:show], module: :courses do
      resources :ratings, only: [:create], module: :teachers
    end
  end

  namespace :api do
    resources :ratings, only: [:destroy]
  end

  namespace :admin do
    resources :courses
    resources :teachers
  end

  root to: "courses#index"
end
