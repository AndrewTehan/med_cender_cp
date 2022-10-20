class InspectionReport < ApplicationRecord
    validates :medical_report, :medical_appointment, :patient_id, :visit_id, presence: true
end
