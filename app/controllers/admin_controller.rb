class AdminController < ApplicationController
  before_action :current_user
  before_action :check_admin

  def index
    render "index"
  end

  def list
    render "users"
  end

  def change
    @user = User.find(params[:id])
    render "profile"
  end

  def new
    render "new"
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
    redirect_to "/list"
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
    redirect_to "/list"
  end

  def menu
    render "menu"
  end

  def updateMenuStatus
    id = params[:id]
    status = params[:status]
    menu = MenuItem.find(id)
    menu.status = status
    menu.save!
    redirect_to "/admin/menu"
  end

  def editMenu
    id = params[:id]
    @menu = MenuItem.find(id)
    render "editMenu"
  end

  def updateMenu
    id = params[:id]
    menu = MenuItem.find(id)
    menu.name = params[:name]
    menu.description = params[:description]
    menu.price = params[:price]
    menu.menu_category_id = params[:menu_category_id]
    unless menu.save
      flash[:error] = menu.errors.full_messages.join(", ")
    end
    redirect_to "/admin/menu"
  end

  def deleteMenu
    id = params[:id]
    menu = MenuItem.find(id)
    menu.destroy
    redirect_to "/admin/menu"
  end

  def destroy
    id = params[:id]
    user = User.find(id)
    user.destroy
    redirect_to todos_path
  end
end
