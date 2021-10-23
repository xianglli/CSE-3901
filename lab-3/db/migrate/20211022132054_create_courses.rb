class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :term
      t.string :effectiveDate
      t.string :effectiveStatus
      t.string :title
      t.string :shortDescription
      t.text :description
      t.string :equivalentId
      t.string :allowMultiEnroll
      t.string :maxUnits
      t.string :minUnits
      t.string :repeatUnitsLimit
      t.string :grading
      t.string :component
      t.string :primaryComponent
      t.string :offeringNumber
      t.string :academicGroup
      t.string :subject
      t.string :catalogNumber
      t.string :campus
      t.string :academicOrg
      t.string :academicCareer
      t.string :cipCode
      t.jsonb :courseAttributes
      t.string :campusCode
      t.string :subjectDesc
      t.string :catalogLevel
      t.string :courseId
      t.string :md5
      t.boolean :tag
    end
  end
end
