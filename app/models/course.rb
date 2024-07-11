class Course < ApplicationRecord
  # Associations
  has_many :tutors, dependent: :destroy

  # Validations
  validates :name, :description, :start_date, :end_date, presence: true

  accepts_nested_attributes_for :tutors
end
