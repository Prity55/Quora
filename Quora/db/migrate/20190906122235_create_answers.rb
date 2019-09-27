class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.integer :upvote_count
      t.integer :downvote_count
      t.integer :view
      t.datetime :last_followed
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
