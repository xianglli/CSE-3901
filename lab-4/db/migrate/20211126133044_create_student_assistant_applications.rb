class CreateStudentAssistantApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :student_assistant_applications do |t|
      t.string :osu_id
      t.string :courseId
      t.text :content
      #status including pending, approved, denied.
      t.string :status, default: "pending"
      t.timestamps
    end
  end
end
