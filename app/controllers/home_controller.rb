class HomeController < ApplicationController
  before_action :current_user

  def index
    if @current_user
      render "home"
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
