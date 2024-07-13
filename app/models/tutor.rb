# frozen_string_literal: true

class Tutor < ApplicationRecord
  # Associations
  belongs_to :course

  # Validations
  validates :name, :email, presence: true
end
