class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.decimal :lat, precision: 10, scale: 8
      t.decimal :lng, precision: 11, scale: 8

      t.timestamps null: false
    end
  end
end
