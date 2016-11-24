Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	#admin
	#resources :admins
	get 'admins', to: 'admins#index'
	get 'admins/:id', to: 'admins#show', :as => "admin"
	# get 'admins/login', to: 'admins#new'
	# post 'admins/login', to: 'admins#create'
	get 'admins/:id/edit', to: 'admins#edit', :as => "edit_admin"
	patch 'admins/:id', to: 'admins#update'
	delete 'admins/:id', to: 'admins#destroy'

	# login
	get 'login', to: 'admins#login'
	post 'login', to: 'admins#login_create'
	get 'logout', to: 'admins#logout_destroy'
	# get 'admins/login', to: 'admins#new', :as => "meetings"
end
