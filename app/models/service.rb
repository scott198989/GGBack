class Service < ApplicationRecord
  has_many :appointments
  has_many :reviews
  has_many :users, through: :appointments
  has_many :images
  # Validations
  validates :name, :description, :price, presence: true
end