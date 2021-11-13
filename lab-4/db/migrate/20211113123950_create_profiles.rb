class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :user_id
      t.string :identity
      t.string :display_name
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :legal_last_name
      t.string :name_suffix
      t.string :username
      t.string :email
      t.jsonb :address
      t.jsonb :phone
      t.jsonb :majors
      t.jsonb :affiliations
      t.jsonb :appointments
      t.text :picture_url
    end
  end
end