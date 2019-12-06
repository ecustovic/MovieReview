Rails.application.routes.draw do
  devise_for :users

  resources :genres
  root "movies#index"

  get "movies/filter/:filter" => "movies#index", as: :filtered_movies
  
  resources :movies do
    resources :reviews
    resources :favourites, only: [:create, :destroy]
  end


  #get "movies" => "movies#index"
  #get "movies/new" => "movies#new"
  #get "movies/:id" => "movies#show", as: "movie"
  #get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  #patch "movies/:id" => "movies#update"

  resources :favourites
end
