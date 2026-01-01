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

ActiveRecord::Schema[8.1].define(version: 2026_01_01_173746) do
  create_table "user_preferences", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "preferred_age_max", null: false
    t.integer "preferred_age_min", null: false
    t.string "preferred_gender", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_user_preferences_on_user_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_uca1400_ai_ci", force: :cascade do |t|
    t.date "birthdate", null: false
    t.datetime "created_at", null: false
    t.string "current_city", null: false
    t.integer "education", null: false
    t.string "first_name", null: false
    t.string "gender", default: "male", null: false
    t.integer "height", null: false
    t.string "home_city", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "user_preferences", "users", on_delete: :cascade
end
