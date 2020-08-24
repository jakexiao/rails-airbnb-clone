class CreateFlats < ActiveRecord::Migration[6.0]
  def change
    create_table :flats do |t|
      t.string :address
      t.integer :price
      t.string :name
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
