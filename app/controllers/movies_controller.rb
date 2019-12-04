class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin, except: [:index, :show]
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  def index
    @search = Search.new
    @ratings = Movie.all.pluck(:rating).uniq

    if params[:search]
      @movies = Movie.search(params[:search]).page(params["page"])
    else
      case params[:filter]
      when "upcoming"
        @movies = Movie.with_attached_images.upcoming.page(params["page"])
      when "recent"
        @movies = Movie.with_attached_images.recent.page(params["page"])
      when "flops"
        @movies = Movie.with_attached_images.flops.page(params["page"])
      when "hits"
        @movies = Movie.with_attached_images.hits.page(params["page"])
      else
        @movies = Movie.with_attached_images.released.page(params["page"])
      end
    end
  end

  def show
    @fans = @movie.fans
    @genres = @movie.genres
    
    if current_user
      @favourite = current_user.favourites.find_by(movie_id: @movie.id)
    end
  end

  def edit
  end

  def update
      if @movie.update(movie_params)
        redirect_to @movie, notice: "Movie successfully updated!"
      else
        render :edit
      end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to @movie, notice: "Movie successfully created!"
      else
        render :new
      end  
  end

  def destroy
    @movie.destroy

    redirect_to movies_url, alert: "Movie successfully deleted!"
  end

  private

  def set_movie
    @movie = Movie.with_attached_images.find_by!(slug: params[:id])
  end

  def movie_params 
    movie_params =
      params.require(:movie).
        permit(:title, :rating, :total_gross, :description, :released_on,
        :duration, :director, images: [], genre_ids: [])
  end
end
