Rails.application.routes.draw do

  root "static#welcome"

  resources :sessions

  resources :users, only: [:new, :create] do
    resources :tasks, only: [:index, :show, :new]
  end

  resources :projects

  resources :tasks



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
