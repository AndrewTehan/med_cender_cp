class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :full_name,       null: false, limit: 255
      t.string :phone_number,    null: false, limit: 255, unique: true
      t.string :email,           null: false, limit: 255, unique: true
      t.string :passport_number, null: false, limit: 255, unique: true
      t.belongs_to :medical_center, index: true, foreign_key: true

      t.timestamps
    end
  end
end
