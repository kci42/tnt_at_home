TntAtHome::Application.routes.draw do
  resources :pages

  get "home/index"

  resources :profiles
  
  match "profiles" => "user_id"
  
  match "/static/(:permalink)" => 'pages#show', :permalink => 'presentacion'

  root :to => "home#index"
  resources :articles do
    member do
      post :notify_friend
    end
    resources :comments
  end
  resources :users
  resource :session
  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout"
end
