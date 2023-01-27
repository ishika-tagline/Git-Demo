Rails.application.routes.draw do
  
  #start root
  root to: "users#index"
  
  resources :properties
  
  #(:name) is optional 
  #get 'users/(:name)', to: 'users#get_name', defaults: {age:21} 

  get 'users/form', to: 'users#create_form'
  post 'users/get_form',to: 'users#get_form'
  get 'users/show', to: 'users#show_form'
  match 'users/bio/(:name)', to: 'users#get_bio', via: [:get],as: 'users_bio'
  
  #http://localhost:3000/users/bio/data/12
  #get 'users/bio/*age',to: 'users#get_bio' 
  
  #get'*users/resume/(:name)', to: redirect('users/bio/%{name}')
  get 'users/resume/(:name)', to: redirect {|path_params, req| "users/bio/#{path_params[:name]}"}

  scope module: 'admin' do     #/accounts
    get 'delete/user/:user_id/account/:id', to: 'accounts#destroy', as: :account_delete
  end

  resources :users do
    scope module: 'admin' do     #/accounts
      resources :accounts
  end


  
end

direct :ruby do
  "https://rubyonrails.org"
end

  # namespace :admin do          #/admin/accounts
  #   resources :accounts
  # end

  # scope module: 'admin' do     #/accounts
  #   resources :accounts
  # end

  # scope module: 'admin' do     #/admin/accounts
  #   scope 'info' do
  #     resources :accounts
  #   end
  # end

  # resources :accounts, module: 'admin'    #/accounts

  # scope :admin do
  #   resources :accounts     #admin/accounts
  # end

  # resources :accounts, path: '/admin/accounts'

  get '/users/:id', to: 'users#show', as: 'user1' #declare path
  get 'user', to: 'users#show'

  # root "articles#index"
  #get 'users/index', to: 'users#index'
  #get 'articles/index', to: 'articles#index'
  #get '/articles/:id', to: 'articles#show'

 resources :articles do
  resources :comments
 end

 # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 # Defines the root path route ("/")
end
