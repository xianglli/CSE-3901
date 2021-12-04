class CreateTeacherRecommandations < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_recommandations do |t|
      t.string :teacher_osu_id
      t.string :student_osu_id
      t.string :courseId
      t.text :content
      t.timestamps
    end
  end
end
