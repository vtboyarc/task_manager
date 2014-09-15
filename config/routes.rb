TaskManager::Application.routes.draw do
  
   root :to => 'pages#index'
   
<<<<<<< HEAD
   resources :users, :tasks
=======
   get "login" => 'logins#new', :as => "login"
   post "login" => 'logins#create', :as => "create_login" 
   
   get "logout" => 'logins#destroy', :as => "logout"

   post "create_user" => 'users#create', :as => "create_user"
   get "signup" => 'users#new', :as => "signup"
   
   resources :users, :tasks, :logins
>>>>>>> 851116494c5648c791388bb56c0f37d5a5ab29d3

end
