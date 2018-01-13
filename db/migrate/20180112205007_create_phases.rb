class CreatePhases < ActiveRecord::Migration[5.1]
  def change
    create_table :phases do |t|
      t.string :name, null: false
      t.references :pipe, foreign_key: true, null: false
      t.jsonb :fields, null: false, default: {}
      t.serial :external_id
      t.index :external_id, unique: true

      t.timestamps
    end
  end
end
