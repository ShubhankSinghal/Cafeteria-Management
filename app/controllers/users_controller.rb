class UsersController < ApplicationController
  before_action :sign_page

  def signinpage
    render "signin"
  end

  def signuppage
    render "signup"
  end

  def signup
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: 2,
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    end
  end

  def signin
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = "Your login attempt was invalid. Please retry."
      redirect_to new_sessions_path
    end
  end
end
