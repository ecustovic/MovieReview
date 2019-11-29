namespace :images do
  desc "Create initial actor's images"
  
  task :init_actor => :environment do
    images = { 
      "Marlon Brando" => "brando.jpg", 
      "Penélope Cruz" => "cruz.jpg", 
      "Robert De Niro" => "de_niro.jpg",
      "Catherine Deneuve" => "deneuve.jpg",
      "Tom Hanks" => "hank.jpg"
    }
    Actor.all.each do |actor|
      unless  images[actor.name].nil?
        actor.image.attach(io: File.open(Rails.root.join('public', 'images', images[actor.name])), filename: images[actor.name], content_type: 'image/jpg')
        actor.save
      end
    end
  end

  desc "Create initial movie's images"
  
  task :init_movie => :environment do
    images = { 
      "Avengers: Endgame" => "avengers-end-game.png", 
      "Captain Marvel" => "captain-marvel.png", 
      "Black Panther" => "black-panther.png",
      "Avengers: Infinity War" => "avengers-infinity-war.png",
      "Green Lantern" => "green-lantern.png",
      "Fantastic Four" => "fantastic-four.png",
      "Iron Man" => "ironman.png",
      "Superman" => "superman.png",
      "Spider-Man" => "spiderman.png",
      "Batman" => "batman.png",
      "Catwoman" => "catwoman.png",
      "Wonder Woman" => "wonder-woman.png"
    }
    Movie.all.each do |movie|
      unless  images[movie.title].nil?
        movie.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', images[movie.title])), filename: images[movie.title], content_type: 'image/png')
        movie.save
      end
    end
  end
end