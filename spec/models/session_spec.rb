# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Session, type: :model do
  describe 'associations' do
    it { should belong_to(:schedule).class_name('Schedule') }
  end

  describe 'Validations' do
    it 'has a valid factory' do
      session = create(:session)
      expect(session).to be_valid
    end
  end
end
