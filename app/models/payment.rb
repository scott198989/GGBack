# app/models/payment.rb
class Payment < ApplicationRecord
  belongs_to :appointment
  # Validations
  validates :amount, :status, :transaction_id, presence: true
  validates :amount, numericality: true
end