class CreateStories < ActiveRecord::Migration[7.2]
  def change
    create_table :stories do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :started_on

      t.timestamps
    end
  end
end
