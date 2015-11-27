Rails.application.routes.draw do
root 'catalogs#index'
resources :authors
resources :books
end
