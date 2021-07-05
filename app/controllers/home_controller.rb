class HomeController < ApplicationController
  before_action :current_user

  def index
    if @current_user
      redirect_to menu_index_path
    else
      render "index"
    end
  end
end
