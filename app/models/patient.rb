require 'elasticsearch/model'

class Patient < ApplicationRecord
  include Elasticsearch::Model

  belongs_to :medical_center

  has_many :visits
  has_many :inspection_reports, through: :visits

  validates :full_name, :phone_number, :email, presence: true
end

Patient.__elasticsearch__.create_index!
Patient.import
