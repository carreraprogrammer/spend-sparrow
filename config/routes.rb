Rails.application.routes.draw do
  root 'landing_pages#index'
  devise_for :users, controllers: { registrations: 'registrations' }, path: ''
  resources :categories, path: 'home' do
    resources :budgets
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
