Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'homes#home'
  get '/about' => 'homes#about'
  
  resources :users, only:[:show, :index, :edit, :update] do
     get '/follower' => 'relationships#follower'
     get '/followed' => 'relationships#followed'
    resource :relationships, only: [:create, :destroy]
    
    get '/list' => 'book_comments#list'
end
  
  resources :books, only:[:index, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only:[:create, :destroy]
    resources :book_comments
    
  end
  
end 
 