class CreateDepartments < ActiveRecord::Migration[6.0]
  def change
    create_table :departments do |t|
      t.string :name, null: false 
      t.string :description, null: false 
      t.belongs_to :medical_center, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
