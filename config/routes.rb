Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'lists#index'

  resources :lists, only: %I[index show create new] do
    resources :bookmarks, only: %I[create new]
  end
  resources :bookmarks, only: %I[destroy]
  resources :lists, only: %I[destroy]
end
