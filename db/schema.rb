  # This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_03_164604) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "memories", force: :cascade do |t|
    t.text "text"
    t.date "date_of_memory"
    t.bigint "memorybox_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memorybox_id"], name: "index_memories_on_memorybox_id"
  end

  create_table "memoryboxes", force: :cascade do |t|
    t.string "title"
    t.bigint "timecapsule_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["timecapsule_id"], name: "index_memoryboxes_on_timecapsule_id"
    t.index ["user_id"], name: "index_memoryboxes_on_user_id"
  end

  create_table "timecapsules", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_timecapsules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "memories", "memoryboxes"
  add_foreign_key "memoryboxes", "timecapsules"
  add_foreign_key "memoryboxes", "users"
  add_foreign_key "timecapsules", "users"
end
