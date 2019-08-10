# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateSession, type: :interactor do
  subject(:context) { CreateSession.call(email: email, password: password) }

  let(:user)     { create(:user, password: password) }
  let(:email)    { user.email }
  let(:password) { 'Password!4' }

  describe '.call' do
    context 'when the provided email and password match a user' do
      it 'succeeds' do
        expect(context).to be_a_success
      end

      it 'returns the user' do
        expect(context.user).to eq user
      end
    end

    context 'when the user does not exist' do
      let(:email) { 'unknown@email.com' }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'returns an error' do
        expect(context.errors).to include 'Email or password is incorrect'
      end
    end

    context 'when the password does not match' do
      let(:user) { create(:user) }

      it 'fails' do
        expect(context).to be_a_failure
      end

      it 'returns an error' do
        expect(context.errors).to include 'Email or password is incorrect'
      end
    end
  end
end
