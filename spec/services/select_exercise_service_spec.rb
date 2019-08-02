# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SelectExerciseService, type: :service do
  subject(:select_exercise_service) { described_class.call(level) }

  context 'when the provided level is equal to one' do
    let(:level) { 1 }

    it { is_expected.to eq Schedule.exercises.fetch(:negative_pull_ups) }
  end

  context 'when the it is less than one' do
    let(:level) { 0 }

    it { is_expected.to eq Schedule.exercises.fetch(:negative_pull_ups) }
  end

  context 'when the provided level is greater than one' do
    let(:level) { 2 }

    it { is_expected.to eq Schedule.exercises.fetch(:pull_ups) }
  end
end
