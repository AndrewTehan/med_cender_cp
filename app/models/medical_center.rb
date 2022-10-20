class MedicalCenter < ApplicationRecord
  has_many :deparments

  validates :email, :address, :schedule, :legal_entity, presence: true
 end
