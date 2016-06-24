class AdminsController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def require_admin
    unless logged_in? && current_user.admin
      flash[:danger] = "You do not have permission to do that."
      redirect_to home_path
    end
  end

end