require 'rails_helper'

describe Job do
  context 'associations' do
    it { should belong_to(:department).dependent(:destroy) }
    it { should belong_to(:location).dependent(:destroy) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:department_id) }
    it { should validate_presence_of(:location_id) }
  end
end
