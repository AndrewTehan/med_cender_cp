class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :full_name
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
