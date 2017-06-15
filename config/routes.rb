Rails.application.routes.draw do

	root 'welcome#index'
	resources :users
	get 'signin', to: 'sessions#new', as: 'new_session'
	resources :sessions, only: [:create, :destroy]
	resources :attractions, only: [:index, :show, :new, :create, :show, :edit, :update]
	resources :rides, only: [:create]
end