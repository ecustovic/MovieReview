class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :require_signin
  before_action :set_movie

  def index
    @reviews = @movie.reviews
  end

  def new
    @review = @movie.reviews.new
  end

  def create
    @slug = @movie.slug
    @review = @movie.reviews.new(review_params)
    @review.user = current_user
    
    respond_to do |format|
      if @review.save
        format.js { render :create }
      else
        format.js { head: ok}
      end
    end
  end  

private
  def review_params
    params.require(:review).permit( :comment, :stars)
  end

  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id])
  end
end
