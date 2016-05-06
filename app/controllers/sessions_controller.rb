class SessionsController < ApplicationController

  def new
    redirect_to home_path if logged_in?    
  end

  def create
    redirect_to home_path if logged_in?

    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      flash[:notice] = "You are logged in."
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:error] = "There was something wrong with your email or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You are now logged out"
    redirect_to root_path
  end

end