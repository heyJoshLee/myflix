class Admin::VideosController < ApplicationController
  before_filter :require_user
  before_filter :require_admin

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)

    if @video.save
      flash[:success] = "The video #{@video.title} has successfully been added."
      redirect_to new_admin_video_path
    else
      flash[:danger] = "There was an error and your video was not added."
      render :new
    end
    
  end

  def require_admin
    unless current_user.admin
      flash[:danger] = "You do not have permission to do that"
      redirect_to home_path
    end
  end

  private

  def video_params
    params.require(:video).permit!
  end

end