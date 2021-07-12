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

  get "/history" => "menu#history"
  get "/menu" => "menu#index", as: :menu_index
  resources :admin_menu
  resources :admin_menu_category

  get "/checkout" => "orders#checkout"
end
