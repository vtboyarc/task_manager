TaskManager::Application.routes.draw do
  
   root :to => 'pages#index'
   
   get "login" => 'logins#new', :as => "login"
   post "login" => 'logins#create', :as => "create_login" 
   get 'logout' => 'logins#destroy', :as => 'logout'
   
   get "logout" => 'logins#destroy', :as => "logout"

   post "create_user" => 'users#create', :as => "create_user"
   get "signup" => 'users#new', :as => "signup"
   

   get "projects" => 'projects#index', :as => "projects"
   get "projects/new" => 'projects#new', :as => "new_project"
   get "projects/:name/edit" => 'projects#edit', :as => "edit_project"
   post "projects" => 'projects#create' 
   put "project/:name" => 'projects#update'
   delete "projects/:name/delete" => 'projects#destroy', :as => "delete_project"
   get "project/:name" => 'projects#show', :as => "project"
   
   get "tags" => 'tags#index', :as => "tags"
   get "tags/new" => 'tags#new', :as => "new_tag"
   get "tags/:name/edit" => 'tags#edit', :as => "edit_tag"
   post "tags" => 'tags#create' 
   put "tag/:name" => 'tags#update'
   delete "projects/:name/delete" => 'projects#destroy', :as => "delete_project"
   get "tag/:name" => 'tags#show', :as => "tag"
      
   resources :users, :tasks, :comments

   
end
