class Department < ApplicationRecord
    has_many :doctors

    validates :name, :description, :medical_center_id, presence: true
end
