class ForgotPasswordsController < ApplicationController
  def create
    flash[:error] = "Email cannot be blank"
    redirect_to forgot_password_path
  end


end