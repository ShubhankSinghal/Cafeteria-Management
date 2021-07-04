class HomeController < ApplicationController

  def index
    if @current_user
      redirect_to menu_index_path
    else
      render "index"
    end
  end
end
