class InspectionReport < ApplicationRecord
  belongs_to :visit

  validates :medical_report, :medical_appointment, :visit_id, presence: true
end
