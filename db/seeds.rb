# frozen_string_literal: true

User.create(email: "test@#{ENV['WHITELISTED_EMAIL_DOMAIN']}", password: 'Password!2', password_confirmation: 'Password!2')
