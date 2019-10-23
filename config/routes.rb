Rails.application.routes.draw do


  root "movies#index"

  resources :movies do
    resources :reviews
  end

  resource :session, only: [:new, :create, :destroy]

  #get "movies" => "movies#index"
  #get "movies/new" => "movies#new"
  #get "movies/:id" => "movies#show", as: "movie"
  #get "movies/:id/edit" => "movies#edit", as: "edit_movie"
  #patch "movies/:id" => "movies#update"
 
  resources :users
  get "signup" => "users#new"

end
