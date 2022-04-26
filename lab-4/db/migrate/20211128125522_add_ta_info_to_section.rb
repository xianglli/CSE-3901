class AddTaInfoToSection < ActiveRecord::Migration[6.1]
  def change
    add_column :sections, :ta_num, :integer, default: 4
  end
end
