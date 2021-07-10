class ApplicationController < ActionController::Base
  def authenticate_user
    unless current_user
      redirect_to "/", notice: "Please Login to view that page!" if request.original_fullpath != "/"
    end
  end

  def sign_page
    if current_user
      redirect_to "/", notice: "You are already logged in!" if request.original_fullpath != "/"
    end
  end

  def current_user
    return @current_user if @current_user

    @current_user_id = session[:current_user_id]
    if @current_user_id
      @current_user = User.find(@current_user_id)
    else
      @current_user = nil
    end
  end

  def admin
    return @current_user.role == "owner"
  end

  def check_admin
    unless current_user and admin
      redirect_to "/", notice: "You are not ADMIN" if request.original_fullpath != "/"
    end
  end
end
