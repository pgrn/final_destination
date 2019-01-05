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

ActiveRecord::Schema.define(version: 2018_12_23_171506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "calendar_entries", force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
    t.text "location"
    t.datetime "time", null: false
    t.bigint "owner_id"
    t.bigint "calendar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "entry_data", default: "{}", null: false
    t.index ["calendar_id"], name: "index_calendar_entries_on_calendar_id"
    t.index ["entry_data"], name: "index_calendar_entries_on_entry_data", using: :gin
    t.index ["owner_id"], name: "index_calendar_entries_on_owner_id"
  end

  create_table "calendar_entry_participations", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "calendar_entry_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calendar_entry_id"], name: "index_calendar_entry_participations_on_calendar_entry_id"
    t.index ["user_id"], name: "index_calendar_entry_participations_on_user_id"
  end

  create_table "calendars", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "location"
    t.string "calendar_type", null: false
    t.bigint "space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_calendars_on_space_id"
  end

  create_table "kudos", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.integer "value", null: false
    t.bigint "kudoer_id", null: false
    t.bigint "kudoee_id", null: false
    t.bigint "space_id", null: false
    t.datetime "time", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["kudoee_id"], name: "index_kudos_on_kudoee_id"
    t.index ["kudoer_id"], name: "index_kudos_on_kudoer_id"
    t.index ["space_id"], name: "index_kudos_on_space_id"
  end

  create_table "rules", force: :cascade do |t|
    t.text "name", null: false
    t.text "description"
    t.bigint "ruleset_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ruleset_id"], name: "index_rules_on_ruleset_id"
  end

  create_table "rulesets", force: :cascade do |t|
    t.bigint "space_id", null: false
    t.text "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_rulesets_on_space_id"
  end

  create_table "saved_places", force: :cascade do |t|
    t.text "name", null: false
    t.text "description", null: false
    t.bigint "owner_id", null: false
    t.bigint "space_id", null: false
    t.text "address"
    t.text "website"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_saved_places_on_owner_id"
    t.index ["space_id"], name: "index_saved_places_on_space_id"
  end

  create_table "spaces", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "space_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_subscriptions_on_space_id"
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.string "name"
    t.text "location"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "washing_machine_programs", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "space_id"
    t.integer "temp", null: false
    t.string "temp_unit", null: false
    t.integer "speed", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["space_id"], name: "index_washing_machine_programs_on_space_id"
  end

  add_foreign_key "calendar_entries", "calendars"
  add_foreign_key "calendar_entries", "users", column: "owner_id"
  add_foreign_key "calendar_entry_participations", "calendar_entries"
  add_foreign_key "calendar_entry_participations", "users"
  add_foreign_key "calendars", "spaces"
  add_foreign_key "kudos", "spaces"
  add_foreign_key "kudos", "users", column: "kudoee_id"
  add_foreign_key "kudos", "users", column: "kudoer_id"
  add_foreign_key "rules", "rulesets"
  add_foreign_key "rulesets", "spaces"
  add_foreign_key "saved_places", "spaces"
  add_foreign_key "saved_places", "users", column: "owner_id"
  add_foreign_key "subscriptions", "spaces"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "washing_machine_programs", "spaces"
end
