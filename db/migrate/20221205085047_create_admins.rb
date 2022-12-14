class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :full_name,    null: false, limit: 255
      t.string :phone_number, null: false, limit: 255, unique: true
      t.string :email,        null: false, limit: 255, unique: true

      t.timestamps
    end
  end
end
