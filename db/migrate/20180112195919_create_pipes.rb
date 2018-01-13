class CreatePipes < ActiveRecord::Migration[5.1]
  def change
    create_table :pipes do |t|
      t.string :name, null: false
      t.references :organization, foreign_key: true, null: false
      t.jsonb :start_form_fields, null: false, default: {}
      t.serial :external_id
      t.index :external_id, unique: true

      t.timestamps
    end
  end
end
