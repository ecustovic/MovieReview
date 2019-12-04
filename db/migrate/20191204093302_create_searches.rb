class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :rating
      t.string :released_on

      t.timestamps
    end
  end
end
