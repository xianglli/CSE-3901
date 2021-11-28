class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :osu_id
      t.string :classNumber
      t.string :reliable
      t.string :knowledgeable
      t.string :friendly
      t.string :leadership

      t.timestamps
    end
  end
end
