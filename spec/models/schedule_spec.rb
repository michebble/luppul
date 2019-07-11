# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:sessions).class_name('Session') }
  end

  describe 'Validations' do
    it { should validate_presence_of :level }
    it do
      should validate_numericality_of(:level)
        .only_integer
        .is_greater_than_or_equal_to(1)
        .is_less_than_or_equal_to(11)
    end

    it 'has a valid factory' do
      schedule = create(:schedule)
      expect(schedule).to be_valid
    end
  end

  describe '#current_session' do
    let(:schedule)   { create(:schedule) }
    let!(:session)   do
      create(
        :session,
        schedule_id: schedule.id,
        start_date: DateTime.current
      )
    end

    it 'returns the current session' do
      expect(schedule.current_session).to eq session
    end
  end
end
