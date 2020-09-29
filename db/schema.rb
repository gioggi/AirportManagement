# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_29_213628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airplanes", force: :cascade do |t|
    t.string "name"
    t.string "n_number"
    t.integer "seats_numbers"
    t.bigint "airport_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airport_id"], name: "index_airplanes_on_airport_id"
  end

  create_table "airports", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "flight_executions", force: :cascade do |t|
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.bigint "flight_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flight_id"], name: "index_flight_executions_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.string "number"
    t.datetime "departure_time"
    t.datetime "arrival_time"
    t.bigint "arrival_airport_id"
    t.bigint "departure_airport_id"
    t.bigint "airplane_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["airplane_id"], name: "index_flights_on_airplane_id"
    t.index ["arrival_airport_id"], name: "index_flights_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_flights_on_departure_airport_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "passport"
    t.boolean "on_board", default: true, null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_passengers_on_user_id"
  end

  create_table "seats", force: :cascade do |t|
    t.string "number"
    t.datetime "booking_date"
    t.float "price"
    t.bigint "flight_id"
    t.bigint "passenger_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["flight_id"], name: "index_seats_on_flight_id"
    t.index ["passenger_id"], name: "index_seats_on_passenger_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "language"
    t.string "currency"
    t.string "time_zone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "flights", "airports", column: "arrival_airport_id"
  add_foreign_key "flights", "airports", column: "departure_airport_id"
end
