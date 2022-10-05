class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email
      t.string :passport_number
      t.belongs_to :department, index: true, foreign_key: true

      t.timestamps
    end
  end
end
