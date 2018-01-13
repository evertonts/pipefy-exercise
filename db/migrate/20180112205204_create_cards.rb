class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.string :title, null: false
      t.references :phase, foreign_key: true, null: false
      t.jsonb :fields, null: false, default: {}
      t.date :due_date
      t.serial :external_id
      t.index :external_id, unique: true

      t.timestamps
    end
  end
end
