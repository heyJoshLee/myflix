class SessionsController < ApplicationController

  def new
    redirect_to home_path if logged_in?    
  end

  def create
    redirect_to home_path if logged_in?
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        if user.active?
          session[:user_id] = user.id
          redirect_to home_path, notice: "You are signed in"
        else
          flash[:error] = "Your account has been suspended, please contact customer service."
          redirect_to sign_in_path
        end
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