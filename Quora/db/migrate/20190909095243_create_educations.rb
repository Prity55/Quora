class CreateEducations < ActiveRecord::Migration[5.2]
  def change
    create_table :educations do |t|
      t.string :school
      t.string :concentration
      t.string :second_concentration
      t.string :degree
      t.integer :graduation_year
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
