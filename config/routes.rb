Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/" => "home#index", as: :root
  get "/AboutUs" => "home#aboutuspage", as: :aboutus
  delete "/signout" => "home#destroy", as: :destroy_session

  get "/signin" => "users#signinpage", as: :new_sessions
  post "/signin" => "users#signin", as: :sessions
  get "/signup" => "users#signuppage", as: :new_user
  post "/signup" => "users#signup", as: :users
  resources :admin_users

  get "/checkout" => "orders#checkout"

  resources :menu
  get "/history" => "menu#history"

  get "/list" => "admin#list"
  get "/change/:id" => "admin#change"
  get "/new" => "admin#new"
  get "/admin/menu" => "admin#menu"
  get "/editMenu/:id" => "admin#editMenu"
  put "/updateMenu/:id" => "admin#updateMenu"
  put "/updateMenuStatus/:id" => "admin#updateMenuStatus"
  delete "/deleteMenu/:id" => "admin#deleteMenu"
  resources :admin
end
