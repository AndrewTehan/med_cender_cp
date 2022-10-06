class CreateMedicalCenters < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_centers do |t|
      t.string :email, null: false, unique: true, limit: 255
      t.string :address, null: false , unique: true, limit: 255
      t.string :schedule, null: false
      t.string :legal_entity, null: false, limit: 255
      
      t.timestamps
    end
  end
end
