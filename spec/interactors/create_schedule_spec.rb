# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSchedule, type: :interactor do
  subject(:context) { CreateSchedule.call(user_id: user_id, level: 0) }
  let(:user)    { create(:user) }
  let(:user_id) { user.id }

  describe '.call' do
    context 'when given valid params' do
      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'provides the schedule' do
        expect(context.schedule).to eq(user.schedules.first)
      end
    end

    context 'when give invalid params' do
      let(:user_id) { 'foo' }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'returns an error' do
        expect(context.error).to eq('Unable to create Schedule')
      end
    end
  end
end
