class OrdersController < ApplicationController
  before_action :current_user
  before_action :authenticate_user
  before_action :get_order

  def index
    @order = @order.find_by(status: 0)
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

  def update
    id = params[:id]
    order = Order.find(id)
    order.status = 1
    order.date = Date.today
    order.save
    redirect_to root_path
  end
end
