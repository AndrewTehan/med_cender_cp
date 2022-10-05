class CreateMedicalCenters < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_centers do |t|
      t.string :email, null: false 
      t.string :address, null: false 
      t.string :schedule, null: false 
      t.string :legal_entity, null: false 
      
      t.timestamps
    end
  end
end
