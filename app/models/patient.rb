class Patient < ApplicationRecord
    has_many :visits
    has_many :inspection_reports

    validates :full_name, :phone_number, :email, presence: true
end
