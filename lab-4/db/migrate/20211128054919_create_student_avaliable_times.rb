class CreateStudentAvaliableTimes < ActiveRecord::Migration[6.1]
  def change
    create_table :student_avaliable_times do |t|
      t.string :osu_id
      t.string :day_of_week
      t.time :start_time
      t.time :end_time
    end
  end
end
