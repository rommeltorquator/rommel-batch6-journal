Rails.application.routes.draw do
  root "home#index"
  resources :categories

  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'sign_up' }

  get 'dashboard', to: 'home#dashboard'

  resources :tasks, only: [ :create, :edit, :destroy, :update ] do
    collection do
      post 'create2'
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end