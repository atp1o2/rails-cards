class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :category, index: true, foreign_key: true
      t.string :title
      t.string :body
      t.string :notes

      t.timestamps null: false
    end
  end
end
