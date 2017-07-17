Rails.application.routes.draw do
  get "/jobs", to: "jobs#sort"

  root 'companies#index'

  resources :companies do
    resource :contacts, only: [:create]
    resources :jobs do
      resources :comments, only: [:create]
    end
  end
  resources :categories


  get "/dashboard", to: "jobs#dashboard"
end
