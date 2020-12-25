class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :rent
      t.string :adress
      t.integer :age
      t.text :note

      t.timestamps
    end
  end
end
