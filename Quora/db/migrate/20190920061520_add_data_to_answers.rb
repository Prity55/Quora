class AddDataToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :data, :string
  end
end
