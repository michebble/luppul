# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateWorkout, type: :interactor do
  subject(:context) { CreateWorkout.call(schedule: schedule) }
  let(:schedule) { create(:schedule) }

  describe '.call' do
    context 'when given a schedule with no workouts' do
      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provide the workout' do
        expect(context.workout).to eq(schedule.workouts.first)
      end

      it "increrases the schedule's workouts" do
        expect { context }.to change { schedule.workouts.count }.from(0).to(1)
      end
    end
  end
end
