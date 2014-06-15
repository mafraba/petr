class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :organisation, index: true, null: false
      t.text :description
      t.string :name

      t.timestamps
    end
    add_index :profiles, :name, unique: true
  end
end
