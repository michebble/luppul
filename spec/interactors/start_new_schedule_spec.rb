# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StartNewSchedule, type: :interactor do
  subject(:context) { StartNewSchedule.call(user_id: user.id, pull_ups: pull_ups) }
  let(:pull_ups) { 1 }
  let(:user) { create(:user) }

  describe '.call' do
    context 'when given a user and a number of pull ups' do
      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'creates a schedule with a workout for the user' do
        aggregate_failures do
          expect { context }.to change { user.schedules.count }.from(0).to(1)
          expect(context.schedule).to eq(user.schedules.first)
          expect(context.workout).to eq(user.schedules.first.workouts.first)
        end
      end
    end
  end
end
