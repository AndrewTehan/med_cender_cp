class Doctor < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :department
  has_many :visits, dependent: :destroy

  validates :full_name, :phone_number, :email, :department_id, presence: true
end
