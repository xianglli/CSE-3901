class CreateApplications < ActiveRecord::Migration[6.1]
  def change
    create_table :applications do |t|
      t.string :osu_id
      t.string :courseId
      t.text :content
      #status including pending, approved, denied.
      t.string :status
      t.timestamps
    end
  end
end
