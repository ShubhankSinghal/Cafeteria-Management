class AdminUsersController < ApplicationController
  before_action :current_user
  before_action :check_admin
  before_action :get_order

  def index
    render "admin/users"
  end

  def report
    if params[:from_date]
      @from = params[:from_date]
    else
      @from = Date.today - 365
    end
    if params[:to_date]
      @to = params[:to_date]
    else
      @to = Date.today
    end
    @order = @order.where(date: @from..@to)
    render "admin/report"
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
    if params[:first_name]
      user.first_name = params[:first_name]
    end
    if params[:last_name]
      user.last_name = params[:last_name]
    end
    if params[:email]
      user.email = params[:email]
    end
    if params[:role]
      user.role = cat[params[:role].to_i]
    end
    unless user.save
      flash[:error] = user.errors.full_messages.join(", ")
    end
    redirect_to admin_users_path
  end
end
