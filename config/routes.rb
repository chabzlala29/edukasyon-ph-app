Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :courses, only: [:index, :show]

  namespace :admin do
    resources :courses, only: [:index, :edit, :create, :update, :destroy]
  end

  root to: "courses#index"
end
