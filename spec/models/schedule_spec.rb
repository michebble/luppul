require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
  end

  describe 'Validations' do
    it { should validate_presence_of :level }

    it 'has a valid factory' do
      schedule = create(:schedule)
      expect(schedule).to be_valid
    end
  end
end
