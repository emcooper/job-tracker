Rails.application.routes.draw do

  resources :companies do
    resource :contacts, only: [:create]
    resources :jobs do
      resources :comments, only: [:create]
    end
  end
  resources :categories
end
