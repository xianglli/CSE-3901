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

ActiveRecord::Schema.define(version: 2022_04_23_175727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courserecs", force: :cascade do |t|
    t.string "osu_id"
    t.string "courseId"
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
    t.tsvector "tsv"
    t.index ["tsv"], name: "index_courses_on_tsv", using: :gin
  end

  create_table "reviews", force: :cascade do |t|
    t.string "osu_id"
    t.string "classNumber"
    t.string "reliable"
    t.string "knowledgeable"
    t.string "friendly"
    t.string "leadership"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sections", force: :cascade do |t|
    t.string "classNumber"
    t.string "section"
    t.string "component"
    t.string "instructionMode"
    t.string "career"
    t.string "startDate"
    t.string "endDate"
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
    t.string "courseId"
    t.integer "ta_num", default: 4
    t.tsvector "tsv"
    t.index ["tsv"], name: "index_sections_on_tsv", using: :gin
  end

  create_table "student_assistant_applications", force: :cascade do |t|
    t.string "osu_id"
    t.string "courseId"
    t.text "content"
    t.string "status", default: "pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "section"
  end

  create_table "student_avaliable_times", force: :cascade do |t|
    t.string "osu_id"
    t.string "day_of_week"
    t.time "start_time"
    t.time "end_time"
  end

  create_table "student_qualified_courses", force: :cascade do |t|
    t.string "osu_id"
    t.string "courseId"
    t.integer "preference"
  end

  create_table "teacher_recommandations", force: :cascade do |t|
    t.string "teacher_osu_id"
    t.string "student_osu_id"
    t.string "courseId"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
