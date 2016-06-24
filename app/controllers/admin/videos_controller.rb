class Admin::VideosController < AdminsController
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


  private

  def video_params
    params.require(:video).permit!
  end

end