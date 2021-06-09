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
end