class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :shortDescription
      t.text :description
      t.string :component
      t.string :subject
      t.string :catalogNumber
      t.string :campus
      t.jsonb :courseAttributes
      t.string :courseId
      t.string :md5
      t.boolean :tag
    end
  end
end
