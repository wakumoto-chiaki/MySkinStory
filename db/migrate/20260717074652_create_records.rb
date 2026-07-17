class CreateRecords < ActiveRecord::Migration[7.2]
  def change
    create_table :records do |t|
      t.references :story, null: false, foreign_key: true
      t.text :memo
      t.date :recorded_on

      t.timestamps
    end
  end
end
