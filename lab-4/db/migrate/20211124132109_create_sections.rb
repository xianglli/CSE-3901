class CreateSections < ActiveRecord::Migration[6.1]
  def change
    create_table :sections do |t|
      t.string :classNumber
      t.string :section
      t.string :component
      t.string :instructionMode
      t.string :career
      t.string :startDate
      t.string :endDate
      t.string :buildingDescription
      t.string :startTime
      t.string :endTime
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.jsonb :instructors
      t.string :courseId
    end
  end
end
