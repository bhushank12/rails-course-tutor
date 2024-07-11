require 'rails_helper'

RSpec.describe Tutor, type: :model do
  # Associations
  it { should belong_to(:course) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
end
