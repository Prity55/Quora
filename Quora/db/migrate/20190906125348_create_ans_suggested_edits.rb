class CreateAnsSuggestedEdits < ActiveRecord::Migration[5.2]
  def change
    create_table :ans_suggested_edits do |t|
      t.string :content
      t.string :status
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end
end
