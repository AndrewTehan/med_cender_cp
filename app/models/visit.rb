class Visit < ApplicationRecord
    has_many :inspection_reports

    validates :datetime, :doctor_id, :patient_id, presence: true
end
