class AdminUsersController < ApplicationController
  before_action :current_user
  before_action :check_admin

  def index
    render "admin/users"
  end

  def create
    cat = ["owner", "clerk", "customer"]
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
      role: cat[params[:role].to_i],
    )
    unless user.save
      flash[:error] = user.errors.full_messages.join(", ")
    end
    redirect_to admin_users_path
  end

  def update
    cat = ["owner", "clerk", "customer"]
    id = params[:id]
    user = User.find(id)
    user.first_name = params[:first_name]
    user.last_name = params[:last_name]
    user.email = params[:email]
    user.role = cat[params[:role].to_i]
    unless user.save
      flash[:error] = user.errors.full_messages.join(", ")
    end
    redirect_to admin_users_path
  end
end
