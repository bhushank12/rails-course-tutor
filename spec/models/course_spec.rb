require 'rails_helper'

RSpec.describe Course, type: :model do
  # Associations
  it { should have_many(:tutors).dependent(:destroy) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:start_date) }
  it { should validate_presence_of(:end_date) }
  it { should validate_presence_of(:description) }
end
