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

ActiveRecord::Schema.define(version: 2021_10_23_075726) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "term"
    t.string "effectiveDate"
    t.string "effectiveStatus"
    t.string "title"
    t.string "shortDescription"
    t.text "description"
    t.string "equivalentId"
    t.string "allowMultiEnroll"
    t.string "maxUnits"
    t.string "minUnits"
    t.string "repeatUnitsLimit"
    t.string "grading"
    t.string "component"
    t.string "primaryComponent"
    t.string "offeringNumber"
    t.string "academicGroup"
    t.string "subject"
    t.string "catalogNumber"
    t.string "campus"
    t.string "academicOrg"
    t.string "academicCareer"
    t.string "cipCode"
    t.jsonb "courseAttributes"
    t.string "campusCode"
    t.string "subjectDesc"
    t.string "catalogLevel"
    t.string "courseId"
    t.string "md5"
  end

  create_table "sections", force: :cascade do |t|
    t.string "classNumber"
    t.string "section"
    t.string "component"
    t.string "instructionMode"
    t.jsonb "meetings"
    t.integer "courseOfferingNumber"
    t.string "courseId"
    t.string "academicGroup"
    t.string "subject"
    t.string "catalogNumber"
    t.string "career"
    t.string "description"
    t.string "enrollmentStatus"
    t.string "status"
    t.string "type"
    t.string "associatedClass"
    t.boolean "autoEnrollWaitlist"
    t.string "autoEnrollSection1"
    t.string "autoEnrollSection2"
    t.boolean "consent"
    t.integer "waitlistCapacity"
    t.integer "minimumEnrollment"
    t.integer "enrollmentTotal"
    t.integer "waitlistTotal"
    t.string "academicOrg"
    t.string "location"
    t.string "equivalentCourseId"
    t.string "startDate"
    t.string "endDate"
    t.string "cancelDate"
    t.string "primaryInstructorSection"
    t.string "combinedSection"
    t.string "holidaySchedule"
    t.string "sessionCode"
    t.string "sessionDescription"
    t.string "term"
    t.string "campus"
    t.string "academicCareer"
    t.string "secCampus"
    t.string "secAcademicGroup"
    t.string "secCatalogNumber"
    t.string "meetingDays"
    t.string "_parent"
    t.string "subjectDesc"
    t.string "courseTitle"
    t.text "courseDescription"
    t.string "catalogLevel"
    t.string "termCode"
    t.string "md5"
  end

end
