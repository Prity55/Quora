class AddAuthorToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :author, :string
  end
end
