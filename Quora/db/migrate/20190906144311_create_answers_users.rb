class CreateAnswersUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers_users do |t|
      t.references :answer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
