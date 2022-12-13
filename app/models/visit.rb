class Visit < ApplicationRecord
    belongs_to :doctor
    belongs_to :patient
    has_many :inspection_reports

    validates :datetime, :doctor_id, :patient_id, presence: true
end
