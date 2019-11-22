class FavouritesController < ApplicationController
  before_action :require_signin

  def index
    @movies = current_user.favourite_movies.page(params["page"])
  end

  def create
    favourite = Favourite.new(movie_id: params[:movie_id], user_id: current_user.id)

    respond_to do |format|
      if favourite.save
        format.html {redirect_to favourites_path, notice: "Saved as favorite!"}
      else
        format.html {redirect_to favourites_path, notice: "Favorite failed to save."}
      end
    end
  end

  def destroy
    favourite = Favourite.find_by(movie_id: params[:id], user_id: current_user.id)
    favourite.destroy
    flash[:notice] = "Movie unfavorited."
   
    redirect_to root_path
  end
  
private
  def set_movie
    @movie = Movie.find_by!(slug: params[:movie_id])
  end  
end
