class MenuController < ApplicationController
  before_action :authenticate_user

  def index
    render "index"
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to "/"
  end
end
