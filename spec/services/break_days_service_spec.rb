# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BreakDaysService, type: :service do
  subject(:break_days_service) { described_class.call(workout_count) }

  context 'when the provided workout count is zero' do
    let(:workout_count) { 0 }

    it { is_expected.to eq 2.days }
  end

  context 'when the provided workout count is not before a factor of three' do
    let(:workout_count) { 1 }

    it { is_expected.to eq 1.days }
  end

  context 'when the provided workout count is before a factor of three' do
    let(:workout_count) { 2 }

    it { is_expected.to eq 2.days }
  end

  context 'when the provided workout count is three' do
    let(:workout_count) { 3 }

    it { is_expected.to eq 1.days }
  end
end
