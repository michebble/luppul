# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateUser, type: :interactor do
  subject(:context) { CreateUser.call(email: email, password: password, password_confirmation: password_confirmation) }
  let(:email) { 'foo@example.com' }
  let(:password) { 'password' }
  let(:password_confirmation) { password }

  describe '.call' do
    it 'succeeds' do
      expect(context).to be_a_success
    end

    it 'creates a new user' do
      expect { context }.to change { User.count }.by(1)
    end

    context 'when the email is invalid' do
      let(:email) { 'foo' }
      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'does not create a new user' do
        expect { context }.to_not change { User.count }
      end

      it 'returns an error' do
        expect(context.errors).to eq ['Email is invalid']
      end
    end

    context 'when the password is invalid' do
      let(:password) { 'foo' }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'does not create a new user' do
        expect { context }.to_not change { User.count }
      end

      it 'returns an error' do
        expect(context.errors).to eq ['Password is too short (minimum is 8 characters)']
      end
    end

    context 'when the password is not confirmed' do
      let(:password_confirmation) { 'password1234' }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'does not create a new user' do
        expect { context }.to_not change { User.count }
      end

      it 'returns an error' do
        expect(context.errors).to eq ["Password confirmation doesn't match Password"]
      end
    end
  end
end
