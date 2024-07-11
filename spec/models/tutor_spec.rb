require 'rails_helper'

RSpec.describe Tutor, type: :model do
  # Associations
  it { should belong_to(:course) }
end
