class CreateCourserecs < ActiveRecord::Migration[6.1]
  def change
    create_table :courserecs do |t|
      t.string :osu_id
      t.string :courseId
    end
  end
end
