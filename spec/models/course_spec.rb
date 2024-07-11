require 'rails_helper'

RSpec.describe Course, type: :model do
  # Associations
  it { should have_many(:tutors).dependent(:destroy) }
end
