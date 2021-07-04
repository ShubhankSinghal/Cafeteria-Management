class UsersController < ApplicationController
  before_action :sign_page

  def new
    render "users/new"
  end

  def index
    render plain: User.order("id").map { |user| user.to_pleasant_string }
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: params[:role]
    )
    if user.save
      session[:current_user_id] = user.id
      redirect_to "/"
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to "/users/new"
    end
  end

end
