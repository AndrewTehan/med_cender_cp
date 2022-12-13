class Doctor < ApplicationRecord
    belongs_to :department
    has_many :visits

    validates :full_name, :phone_number, :email, :department_id, presence: true
end
