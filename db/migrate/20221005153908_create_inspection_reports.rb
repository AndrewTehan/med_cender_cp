class CreateInspectionReports < ActiveRecord::Migration[6.0]
  def change
    create_table :inspection_reports do |t|
      t.string :medical_report
      t.string :medical_appointment
      t.belongs_to :visit, index: true, foreign_key: true

      t.timestamps
    end
  end
end
