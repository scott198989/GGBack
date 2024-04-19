class User < ApplicationRecord
  has_secure_password
  has_many :appointments
  has_many :reviews
  has_many :services, through: :appointments
  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end