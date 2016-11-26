Rails.application.routes.draw do
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	#### admin
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
	# -------------------
	#### user
	resources :users
	# match ':users(/:destroy(/:id(.:format)))', via: [:delete]
	match 'users/:id',   :to => 'users#destroy',  :via => 'delete'
	# delete 'users/:id', to: 'users#fuck', :as => "user_fuck"
	# login
	get 'login/users', to: 'users#login', :as => "user_login"
	post 'login/users', to: 'users#login_create'
	get 'logout/users', to: 'users#logout_destroy'
	# -------------------
	#### post
	# resources :posts do
	# 	#### comments
	# 	resources :comments
	# end
	resources :posts

	#### comments
	resources :comments

end
