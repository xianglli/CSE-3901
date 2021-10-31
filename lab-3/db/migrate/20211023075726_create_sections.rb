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
    end
  end
end
