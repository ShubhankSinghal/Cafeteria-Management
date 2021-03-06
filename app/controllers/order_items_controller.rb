class OrderItemsController < ApplicationController
  before_action :current_user
  before_action :authenticate_user
  before_action :get_order

  def index
    @order = @order.find_by(status: 0)
    render "orders/checkout"
  end

  def show
    @order_id = params[:id]
    @orderItem = OrderItem.where(order_id: @order_id)
    render "orders/singleOrder"
  end

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
    actual = orderItem.menu_item_quantity.to_i
    update = params[:menu_item_quantity].to_i
    unless actual == 1 and update == -1
      orderItem.menu_item_quantity = actual + update
      unless orderItem.save
        flash[:error] = orderItem.errors.full_messages.join(", ")
      end
    else
      orderItem.destroy
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
