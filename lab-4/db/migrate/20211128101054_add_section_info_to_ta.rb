class AddSectionInfoToTa < ActiveRecord::Migration[6.1]
  def change
    add_column :student_assistant_applications, :section, :string
  end
end
