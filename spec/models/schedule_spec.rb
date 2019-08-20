# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User') }
    it { should have_many(:workouts).class_name('Workout') }
  end

  describe 'Validations' do
    it { should validate_presence_of :exercise }
    it { should validate_presence_of :level }
    it do
      should validate_numericality_of(:level)
        .only_integer
        .is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(10)
    end

    it 'has a valid factory' do
      schedule = create(:schedule)
      expect(schedule).to be_valid
    end
  end

  describe '#current_workout' do
    let(:schedule) { create(:schedule) }
    let!(:completed_workout) do
      create(
        :workout,
        schedule_id: schedule.id,
        start_date: DateTime.current,
        completed_at: DateTime.current
      )
    end
    let!(:workout) do
      create(
        :workout,
        schedule_id: schedule.id,
        start_date: DateTime.current
      )
    end

    it 'returns the uncompleted workout' do
      expect(schedule.current_workout).to eq workout
    end
  end

  describe '#completed_final_break_period?' do
    let(:schedule)     { create(:schedule, completed_at: completed_at) }
    let(:completed_at) { Time.current - 3.days }

    it 'returns true' do
      expect(schedule.completed_final_break_period?).to eq true
    end

    context 'when the schedule is not completed' do
      let(:completed_at) { nil }

      it 'returns false' do
        expect(schedule.completed_final_break_period?).to eq false
      end
    end

    context 'when the break period has not passed' do
      let(:completed_at) { Time.current - 2.day }

      it 'returns false' do
        expect(schedule.completed_final_break_period?).to eq false
      end
    end
  end

  describe '#in_final_break_period?' do
    let(:schedule)     { create(:schedule, completed_at: completed_at) }
    let(:completed_at) { Time.current - 1.days }

    it 'returns true' do
      expect(schedule.in_final_break_period?).to eq true
    end

    context 'when the schedule is not completed' do
      let(:completed_at) { nil }

      it 'returns false' do
        expect(schedule.in_final_break_period?).to eq false
      end
    end

    context 'when the break period has not passed' do
      let(:completed_at) { Time.current - 3.day }

      it 'returns false' do
        expect(schedule.in_final_break_period?).to eq false
      end
    end
  end
end
