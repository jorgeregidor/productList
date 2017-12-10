Rails.application.routes.draw do

 devise_for :users, :skip => [:registrations] 
	as :user do
	  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
	  put 'users' => 'devise/registrations#update', :as => 'user_registration'
	end
	
	root to: 'pages#home'

	namespace :admin do
  	resources :categories
  	resources :currencies
  	resources :suppliers
  	resources :products, except: :index
  	root to: 'products#index'
  end
end
