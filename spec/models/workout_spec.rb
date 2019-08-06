# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Workout, type: :model do
  describe 'associations' do
    it { should belong_to(:schedule).class_name('Schedule') }
  end

  describe 'Validations' do
    it { should validate_presence_of :sets }
    it { should validate_presence_of :start_date }

    it 'has a valid factory' do
      workout = create(:workout)
      expect(workout).to be_valid
    end
  end

  describe '#human_start_date' do
    let(:workout) do
      create(
        :workout,
        start_date: '2019-07-11'
      )
    end

    it 'returns a human readable start day' do
      expect(workout.human_start_date).to eq '11th of July'
    end
  end
end
