Rails.application.routes.draw do

	root 'catalogs#index'
	get '/signup', to: 'user#new', as: 'signup'
	get '/signin', to: 'sessions#new', as: 'signin'
	post '/signin', to: 'sessions#create'
	get '/signout', to: 'sessions#destroy', as: 'signout'
	resources :authors
	resources :books
	resources :users, only: [:index,:show, :new, :create, :destroy]

end
