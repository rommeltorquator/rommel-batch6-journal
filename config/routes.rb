Rails.application.routes.draw do
  resources :categories

  devise_for :users
  root "home#index"
  get 'dashboard', to: 'home#dashboard'

  resources :tasks, only: [ :create, :edit, :destroy, :update ] do
    collection do
      post 'create2'
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end