class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :full_name, limit: 255
      t.string :phone_number, unique: true, limit: 255
      t.string :email, unique: true, limit: 255
      t.string :passport_number, unique: true, limit: 255

      t.timestamps
    end
  end
end
