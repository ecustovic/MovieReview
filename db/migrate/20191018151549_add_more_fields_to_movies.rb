class AddMoreFieldsToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :director, :string, default: "."
    add_column :movies, :duration, :string, duration: "0.00"
    add_column :movies, :image_file_name, :string, default: "batman.png"
  end
end
