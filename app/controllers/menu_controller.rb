class MenuController < ApplicationController
  def index
    #@todos = current_user.todos
    render "index"
  end
end
