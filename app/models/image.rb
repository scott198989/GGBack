class Image < ApplicationRecord
  belongs_to :service, optional: true
  # Validations
  validates :file_path, presence: true
end