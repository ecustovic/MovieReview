module ActorsHelper
  def actor_avatar(actor)
    if actor.image.attached?
      image_tag actor.image
    else
      image_tag("default_movie_image.png")
    end
  end
end
