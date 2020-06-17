Rails.application.routes.draw do

  root "static#welcome"



  resources :sessions
  
  resources :users, only: [:new, :create] do
    resources :tasks, only: [:index, :show, :new]
  end

  resources :projects

  resources :tasks

  get '/signout', to: 'sessions#destroy'

  get '/tasks/:id/complete', to: "tasks#complete"

  get '/auth/facebook/callback' => 'sessions#create'

  get '/users/most_projects', to: "users#most_projects"




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
