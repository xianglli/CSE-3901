class CreateStudentQualifiedCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :student_qualified_courses do |t|
      t.string :osu_id
      t.string :courseId
      t.integer :preference
    end
  end
end
