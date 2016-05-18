class UsersController < ApplicationController

  before_filter :require_user, only: [:show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    AppMailer.send_welcome_email(@user).deliver
    if @user.save
      flash[:notice] = "Your account was created"
      redirect_to videos_path
    else
      render :new
    end
    
  end

  private

  def user_params
    params.require(:user).permit!
    
  end

end