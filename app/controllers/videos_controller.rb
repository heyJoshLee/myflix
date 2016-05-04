class VideosController < ApplicationController

 before_action :set_video, only: [:show]

  def index
    @categories = Category.all
  end


  def search
    @term = params[:search_term]
    @results = Video.search_by_title(params[:search_term])
  end

  def show
  end


 

  private

  def set_video
    @video = Video.find(params[:id])
  end

end