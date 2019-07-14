# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session, type: :model do
  describe 'associations' do
    it { should belong_to(:schedule).class_name('Schedule') }
  end

  describe 'Validations' do
    it { should validate_presence_of :exercise }
    it { should validate_presence_of :sets }
    it { should validate_presence_of :start_date }

    it 'has a valid factory' do
      session = create(:session)
      expect(session).to be_valid
    end
  end

  describe '#human_start_date' do
    let(:session) do
      create(
        :session,
        start_date: '2019-07-11'
      )
    end

    it 'returns a human readable start day' do
      expect(session.human_start_date).to eq '11th of July'
    end
  end
end
