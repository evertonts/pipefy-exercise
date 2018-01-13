class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name, null: false
      t.serial :external_id
      t.index :external_id, unique: true

      t.timestamps
    end
  end
end
