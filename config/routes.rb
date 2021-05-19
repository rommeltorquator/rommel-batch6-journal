Rails.application.routes.draw do
  root "home#index"

  resources :tasks, only: [ :index, :new, :create, :show, :edit, :update, :destroy ]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
