class AddFieldToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :description, :text
    add_column :movies, :released_on, :string
    add_column :movies, :date, :string
  end
end
