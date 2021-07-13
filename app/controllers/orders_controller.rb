class OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    render "menu"
  end

  def history
    render "history"
  end

  def checkout
    render "checkout"
  end

  def create
    orderItem = Order.new(
      date: Date.today,
      user_id: params[:user_id],
      delivered_at: nil,
    )
    unless orderItem.save
      flash[:error] = orderItem.errors.full_messages.join(", ")
    end
    redirect_to menu_path
  end
end
