Rails.application.routes.draw do
	root 'catalogs#index'
 	
	get '/signup', to: 'users#new', as: 'signup'
	get '/signin', to: 'sessions#new', as: 'signin'
	post '/signin', to: 'sessions#create'
	get '/signout', to: 'sessions#destroy', as: 'signout'

	namespace :admin do
		get 'base/index'
		resources :authors
		resources :books
		resources :publishers
	end
	
	resources :users, only: [:index,:show, :new, :create, :destroy]
	resources :catalogs, only: [:index, :show] do
		collection do
			post :search, to: "catalogs#search"
		end
	end

	resources :carts,only: [:show, :destroy]
	resources :cart_items, only: [:create]
	resources :orders, only: [:new, :create]

end
