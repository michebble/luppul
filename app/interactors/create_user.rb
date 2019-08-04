# frozen_string_literal: true

# CreateUser
class CreateUser
  include Interactor

  delegate :email, :password, :password_confirmation, to: :context

  def call
    user = User.new(
      email: email,
      password: password,
      password_confirmation: password_confirmation
    )
    if user.save
      context.user = user
    else
      context.fail!(errors: user.errors.full_messages)
    end
  end
end
