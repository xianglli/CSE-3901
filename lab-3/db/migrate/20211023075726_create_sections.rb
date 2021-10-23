class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :classNumber
      t.string :section
      t.string :component
      t.string :instructionMode
      t.jsonb :meetings
      t.integer :courseOfferingNumber
      t.string :courseId
      t.string :academicGroup
      t.string :subject
      t.string :catalogNumber
      t.string :career
      t.string :description
      t.string :enrollmentStatus
      t.string :status
      t.string :type
      t.string :associatedClass
      t.boolean :autoEnrollWaitlist
      t.string :autoEnrollSection1
      t.string :autoEnrollSection2
      t.boolean :consent
      t.integer :waitlistCapacity
      t.integer :minimumEnrollment
      t.integer :enrollmentTotal
      t.integer :waitlistTotal
      t.string :academicOrg
      t.string :location
      t.string :equivalentCourseId
      t.string :startDate
      t.string :endDate
      t.string :cancelDate
      t.string :primaryInstructorSection
      t.string :combinedSection
      t.string :holidaySchedule
      t.string :sessionCode
      t.string :sessionDescription
      t.string :term
      t.string :campus
      t.string :academicCareer
      t.string :secCampus
      t.string :secAcademicGroup
      t.string :secCatalogNumber
      t.string :meetingDays
      t.string :_parent
      t.string :subjectDesc
      t.string :courseTitle
      t.text :courseDescription
      t.string :catalogLevel
      t.string :termCode
      t.string :md5
    end
  end
end
