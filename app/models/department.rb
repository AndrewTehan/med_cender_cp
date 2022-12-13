class Department < ApplicationRecord
    belongs_to :medical_center
    has_many :doctors

    validates :name, :description, :medical_center_id, presence: true
end
