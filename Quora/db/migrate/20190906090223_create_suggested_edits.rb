class CreateSuggestedEdits < ActiveRecord::Migration[5.2]
  def change
    create_table :suggested_edits do |t|
      t.string :content
      t.string :status
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
