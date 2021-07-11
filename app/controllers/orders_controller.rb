class OrdersController < ApplicationController
  before_action :authenticate_user

  def checkout
    render "checkout"
  end
end
