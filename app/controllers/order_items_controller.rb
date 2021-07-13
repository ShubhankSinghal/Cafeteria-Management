class OrderItemsController < ApplicationController
  before_action :authenticate_user

  def create
    orderItem = OrderItem.new(
      order_id: params[:order_id],
      menu_item_id: params[:menu_item_id],
      menu_item_name: params[:menu_item_name],
      menu_item_price: params[:menu_item_price],
      menu_item_quantity: 1,
    )
    unless orderItem.save
      flash[:error] = orderItem.errors.full_messages.join(", ")
    end
    redirect_to menu_path
  end

  def update
    id = params[:id]
    orderItem = OrderItem.find(id)
    orderItem.menu_item_quantity += params[:menu_item_quantity]
    unless orderItem.save
      flash[:error] = orderItem.errors.full_messages.join(", ")
    end
    redirect_to menu_path
  end

  def destroy
    id = params[:id]
    orderItem = OrderItem.find(id)
    orderItem.destroy
    redirect_to menu_path
  end
end
