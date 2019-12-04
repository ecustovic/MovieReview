class Search < ApplicationRecord
  def search_movies
    movies = Movie.all

    movies = movies.where(["lower(title) LIKE ?", "%#{keywords.downcase}%"]) if keywords.present?
    movies = movies.where(["rating LIKE ?", rating]) if rating.present?
    movies = movies.where(["released_on LIKE ?", released_on]) if released_on.present?

    return movies
  end
end
