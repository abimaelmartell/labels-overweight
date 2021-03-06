# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_12_044612) do

  create_table "labels", force: :cascade do |t|
    t.string "tracking_number"
    t.string "carrier"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "carrier_weight"
    t.string "carrier_weight_unit"
  end

  create_table "parcels", force: :cascade do |t|
    t.integer "label_id"
    t.float "length"
    t.float "width"
    t.float "height"
    t.float "weight"
    t.string "distance_unit"
    t.string "mass_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_parcels_on_label_id"
  end

end
