class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :osu_id
      t.string :role
      t.string :display_name
      t.boolean :admin
      t.string :avator
      t.string :remember_token
      t.datetime :remember_token_expires_at

      t.timestamps
    end
  end
end
