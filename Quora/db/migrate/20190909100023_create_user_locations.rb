class CreateUserLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_locations do |t|
      t.string :location
      t.integer :start_year
      t.integer :end_year
      t.boolean :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
