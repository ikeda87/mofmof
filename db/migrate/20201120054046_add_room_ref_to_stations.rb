class AddRoomRefToStations < ActiveRecord::Migration[5.2]
  def change
    add_reference :stations, :room, foreign_key: true
  end
end
