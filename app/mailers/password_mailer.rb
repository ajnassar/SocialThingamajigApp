class PasswordMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset(user)
    @user_email = user.email

    # @link = "#{edit_user_password_url}?#{user.password_reset_token}"

    @link = Addressable::URI.new(
     :scheme => "http",
     :host => "localhost",
     :port => "3000",
     :path => "user_password/edit",
     :query_values => {
       :password_reset_token => user.password_reset_token
     }
    ).to_s

    mail(to: @user_email, subject: "Email useful infromation")
  end
end