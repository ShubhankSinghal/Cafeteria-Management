class AdminMenuController < ApplicationController
  before_action :current_user
  before_action :check_admin

  def index
    render "admin/menu"
  end

  def create
    menu = MenuItem.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
      menu_category_id: params[:menu_category_id],
      status: true,
    )
    unless menu.save
      flash[:error] = menu.errors.full_messages.join(", ")
    end
    redirect_to admin_menu_index_path
  end

  def update
    id = params[:id]
    menu = MenuItem.find(id)
    if params[:name]
      menu.name = params[:name]
    else
      menu.status = params[:status]
    end
    if params[:description]
      menu.description = params[:description]
    end
    if params[:price]
      menu.price = params[:price]
    end
    if params[:menu_category_id]
      menu.menu_category_id = params[:menu_category_id]
    end
    unless menu.save
      flash[:error] = menu.errors.full_messages.join(", ")
    end
    redirect_to admin_menu_index_path
  end

  def destroy
    id = params[:id]
    menu = MenuItem.find(id)
    menu.destroy
    redirect_to admin_menu_index_path
  end
end
