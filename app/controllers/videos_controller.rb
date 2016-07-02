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

  def advanced_search
    options = {
      reviews: params[:reviews],
      ratings_from: params[:rating_from],
      rating_to: params[:rating_to]
    }
    if params[:query]
      @videos = Video.search(params[:query], options).records.to_a
    else
      @videos = []
    end
  end

end