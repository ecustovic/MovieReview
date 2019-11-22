module FavouritesHelper
  def fave_or_unfave_button(movie, favourite)
    if favourite
      link_to  "♡ Unfave", favourite_path(id: movie.id), method: :delete, :class => "btn btn-primary"
    else
      link_to "❤ Fave", favourites_path(movie_id: movie.id), method: :post, :class => "btn btn-primary"
    end
  end

  def unfave_button(movie)
    link_to  "♡ Unfave", favourite_path(id: movie.id), method: :delete, :class => "btn btn-primary"
  end
end
