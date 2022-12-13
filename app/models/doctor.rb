class Doctor < ApplicationRecord
    belongs_to :department
    has_many :visits, dependent: :destroy

    validates :full_name, :phone_number, :email, :department_id, presence: true
end
