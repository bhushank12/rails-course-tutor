class Tutor < ApplicationRecord
  belongs_to :course

  # Validation
  validates :name, :email, presence: true
end
