require 'rails_helper'

describe Location do
  context 'associations' do
    it { should have_many(:jobs) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
