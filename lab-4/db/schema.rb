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

ActiveRecord::Schema.define(version: 2021_11_24_132426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.string "osu_id"
    t.string "courseId"
    t.text "content"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.string "shortDescription"
    t.text "description"
    t.string "component"
    t.string "subject"
    t.string "catalogNumber"
    t.string "campus"
    t.jsonb "courseAttributes"
    t.string "courseId"
  end

  create_table "sections", force: :cascade do |t|
    t.string "courseId"
    t.string "classNumber"
    t.string "section"
    t.string "component"
    t.string "instructionMode"
    t.string "career"
    t.string "startDate"
    t.string "endDate"
    t.string "class_num"
    t.string "buildingDescription"
    t.string "startTime"
    t.string "endTime"
    t.boolean "monday"
    t.boolean "tuesday"
    t.boolean "wednesday"
    t.boolean "thursday"
    t.boolean "friday"
    t.boolean "saturday"
    t.boolean "sunday"
    t.jsonb "instructors"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "osu_id"
    t.string "role"
    t.string "display_name"
    t.boolean "admin"
    t.string "avator"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
