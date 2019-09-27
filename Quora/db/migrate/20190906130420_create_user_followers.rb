class CreateUserFollowers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_followers do |t|
      t.integer :user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
