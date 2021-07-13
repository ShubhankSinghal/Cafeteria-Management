class OrdersController < ApplicationController
  before_action :current_user
  before_action :authenticate_user

  def index
    @order = current_user.orders.find_by(status: 0)
    unless @order
      @order = Order.new(
        date: Date.today,
        user_id: @current_user.id,
        delivered_at: nil,
        status: 0,
      )
      unless @order.save
        flash[:error] = @order.errors.full_messages.join(", ")
      end
    end
    render "menu"
  end

  def history
    render "history"
  end

  def checkout
    render "checkout"
  end

  def create
    order = Order.new(
      date: Date.today,
      user_id: @current_user.id,
      delivered_at: nil,
      status: 0,
    )
    unless order.save
      flash[:error] = order.errors.full_messages.join(", ")
    end
    redirect_to menu_path
  end
end
