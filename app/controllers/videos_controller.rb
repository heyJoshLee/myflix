class VideosController < ApplicationController

 before_action :require_user


  def index
    @categories = Category.all
  end


  def search
    @term = params[:search_term]
    @results = Video.search_by_title(params[:search_term])
  end

  def show
    @video = VideoDecorator.decorate(Video.find(params[:id]))
    @review = Review.new
    @reviews = @video.reviews
  end

 

  private


end