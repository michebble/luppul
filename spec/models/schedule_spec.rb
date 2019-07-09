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

  describe '#next_session_date' do
    let(:schedule)   { create(:schedule) }
    let(:start_date) { '2019-07-11' }
    let!(:session)   do
      create(
        :session,
        schedule_id: schedule.id,
        start_date: start_date
      )
    end

    it 'returns the start date of the session' do
      expect(schedule.next_session_date).to eq '11th of July'
    end
  end
end
