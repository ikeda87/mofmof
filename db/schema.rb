ActiveRecord::Schema.define(version: 2020_11_20_054046) do

  enable_extension "plpgsql"

  create_table "rooms", force: :cascade do |t|
    t.text "note"
    t.string "name"
    t.string "adress"
    t.integer "rent"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "route_name"
    t.string "station_name"
    t.integer "minutes"
    t.integer "room_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_id"], name: "index_stations_on_room_id"
  end

  add_foreign_key "rooms", "stations"
end
