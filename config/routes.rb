Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "home#index"
  get "/AboutUs" => "home#about"
  delete "/signout" => "home#destroy", as: :destroy_session

  resources :menu
  get "/shopping" => "menu#shopping"
  get "/history" => "menu#history"

  get "/list" => "admin#list"
  get "/change/:id" => "admin#change"
  get "/new" => "admin#new"
  get "/admin/menu" => "admin#menu"
  resources :admin

  resources :users
  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
end
