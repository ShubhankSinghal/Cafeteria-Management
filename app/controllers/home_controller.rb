class HomeController < ApplicationController
  before_action :current_user

  def index
    if @current_user
      if @current_user.role == "owner"
        redirect_to admin_index_path
      else
        render "home"
      end
    else
      render "index"
    end
  end

  def about
    render "about"
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to "/"
  end
end
