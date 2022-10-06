class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :full_name, limit: 255
      t.string :phone_number, unique: true, limit: 255
      t.string :email, unique: true, limit: 255
      t.belongs_to :department, index: true, foreign_key: true

      t.timestamps
    end
  end
end
