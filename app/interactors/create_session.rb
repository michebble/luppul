# frozen_string_literal: true

# CreateSession
class CreateSession
  include Interactor

  delegate :email, :password, to: :context

  def call
    user = User.find_by(email: email.downcase)
    if user && user.authenticate(password)
      context.user = user
    else
      context.fail!(errors: ['Email or password is incorrect'])
    end
  end
end
