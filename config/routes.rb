TaskManager::Application.routes.draw do
  
   root :to => 'pages#index'
   
   resources :users, :tasks
  
end
