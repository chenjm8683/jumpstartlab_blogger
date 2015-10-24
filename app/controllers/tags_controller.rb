class TagsController < ApplicationController
  before_filter :require_login, only: [:destroy]

  def require_login
    unless logged_in?
      flash.notice = "Loggin required!"
      redirect_to root_path
      return false
    end
  end

  def show
    @tag = Tag.find(params[:id])
  end
end
