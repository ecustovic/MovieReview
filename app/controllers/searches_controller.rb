class SearchesController < ApplicationController
  def new
    @search = Search.new
    @ratings = Movie.all.pluck(:rating).uniq
  end

  def create 
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private

  def search_params 
    params.require(:search).permit(:keywords, :rating, :description, :released_on)
  end
end
