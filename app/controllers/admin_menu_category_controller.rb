class AdminMenuCategoryController < ApplicationController
  before_action :current_user
  before_action :check_admin

  def create
    category = MenuCategory.new(
      name: params[:name],
      status: true,
    )
    unless category.save
      flash[:error] = category.errors.full_messages.join(", ")
    end
    redirect_to admin_menu_index_path
  end

  def update
    id = params[:id]
    category = MenuCategory.find(id)
    if params[:name]
      category.name = params[:name]
    else
      category.status = params[:status]
    end
    unless category.save
      flash[:error] = category.errors.full_messages.join(", ")
    end
    redirect_to admin_menu_index_path
  end

  def destroy
    id = params[:id]
    category = MenuCategory.find(id)
    category.destroy
    redirect_to admin_menu_index_path
  end
end
