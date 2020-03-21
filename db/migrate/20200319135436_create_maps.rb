class CreateMaps < ActiveRecord::Migration[6.0]
  def change
    create_table :maps do |t|
      t.string :name
      t.string :type
      t.integer :price
      t.string :closing_day
      t.time :open_time
      t.time :close_time
      t.text :website
      t.boolean :beji
      t.integer :tel
      t.boolean :parking
      t.text :address

      t.timestamps
    end
  end
end
