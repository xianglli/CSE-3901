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

ActiveRecord::Schema.define(version: 2021_10_31_063232) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string "md5"
    t.boolean "tag"
  end

  create_table "meetings", force: :cascade do |t|
    t.string "classNumber"
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

  create_table "profiles", force: :cascade do |t|
    t.string "user_id"
    t.string "identity"
    t.string "display_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "legal_last_name"
    t.string "name_suffix"
    t.string "username"
    t.string "email"
    t.jsonb "address"
    t.jsonb "phone"
    t.jsonb "majors"
    t.jsonb "affiliations"
    t.jsonb "appointments"
    t.text "picture_url"
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
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "osuid", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
