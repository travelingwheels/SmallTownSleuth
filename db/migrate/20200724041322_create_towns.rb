class CreateTowns < ActiveRecord::Migration[6.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.string :shopping
      t.string :dinning
      t.string :attraction
      t.string :lodging

      t.timestamps
    end
  end
end
