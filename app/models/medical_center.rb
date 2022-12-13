class MedicalCenter < ApplicationRecord
  has_many :departments, dependent: :destroy
  has_many :patients, dependent: :destroy

  validates :email, :address, :schedule, :legal_entity, presence: true
 end
