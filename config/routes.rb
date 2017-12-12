Rails.application.routes.draw do

 devise_for :users, :skip => [:registrations] 
	as :user do
	  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
	  put 'users' => 'devise/registrations#update', :as => 'user_registration'
	end
	
	root to: 'pages#home'

	namespace :admin do
  	resources :categories, except: :show
  	resources :currencies, except: :show
  	resources :suppliers, except: :show
  	resources :products, except:[:index,:show]
  	root to: 'products#index'
  end
end
