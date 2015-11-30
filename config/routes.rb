Rails.application.routes.draw do
root 'catalogs#index'
resources :authors
resources :books
resources :users, only: [:index,:show, :new, :create, :destroy]
end
