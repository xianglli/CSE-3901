class AddOsuidToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :osuid, :string, null: false, default: ""
    add_column :users, :osurole, :string
  end
end
