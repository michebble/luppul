# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSession, type: :interactor do
  subject(:context) { CreateSession.call(schedule: schedule) }
  let(:schedule) { create(:schedule) }

  describe '.call' do
    context 'when given a schedule with no sessions' do
      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provide the ssession' do
        expect(context.session).to eq(schedule.sessions.first)
      end

      it "increrases the schedule's sessions" do
        expect { context }.to change { schedule.sessions.count }.from(0).to(1)
      end
    end
  end
end
