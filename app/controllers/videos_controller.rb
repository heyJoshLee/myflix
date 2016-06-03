class VideosController < ApplicationController

 before_action :set_video, only: [:show]
 before_action :require_user


  def index
    @categories = Category.all
  end


  def search
    @term = params[:search_term]
    @results = Video.search_by_title(params[:search_term])
  end

  def show
    @video = Video.find(params[:id])
    @review = Review.new
    @reviews = @video.reviews
  end


 

  private

  def set_video
    @video = Video.find(params[:id])
  end

end