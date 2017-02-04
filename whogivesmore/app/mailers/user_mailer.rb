class UserMailer < ApplicationMailer
  def reset_password_instructions(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: reset_password)
end
end
