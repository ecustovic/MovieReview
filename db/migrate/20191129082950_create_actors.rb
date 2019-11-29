class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name, null: false
      t.date :birth_date
      t.integer :gender

      t.timestamps
    end
  end
end
