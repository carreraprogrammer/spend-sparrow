Rails.application.routes.draw do
  devise_for :users, path: ''
  resources :categories do
    resources :budgets
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
