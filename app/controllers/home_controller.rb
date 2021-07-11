class HomeController < ApplicationController
  before_action :current_user

  def index
    render "index"
  end

  def aboutuspage
    render "aboutus"
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end
end
