# app/models/appointment.rb
class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :service
  has_one :payment

  # Validations
  validates :date, :status, presence: true
end