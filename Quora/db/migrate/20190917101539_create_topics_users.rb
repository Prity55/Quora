class CreateTopicsUsers< ActiveRecord::Migration[5.2]
  def change
    create_table :topics_users do |t|
      t.references :topic, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
