TaskManager::Application.routes.draw do
  
   root :to => 'pages#index'
   
   get "login" => 'logins#new', :as => "login"
   post "login" => 'logins#create', :as => "create_login" 
   get 'logout' => 'logins#destroy', :as => 'logout'
   
   get "logout" => 'logins#destroy', :as => "logout"

   post "create_user" => 'users#create', :as => "create_user"
   get "signup" => 'users#new', :as => "signup"
   
   get 'projects' => 'projects#index'
   get 'projectss/:name' => 'projects#show', :as => 'show_project'
   
   resources :users, :tasks, :projects, :tags, :emails
   
end
