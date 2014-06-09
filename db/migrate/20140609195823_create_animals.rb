class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :sex
      t.date :birthdate
      t.references :organisation, index: true
      t.text :description

      t.timestamps
    end
  end
end
