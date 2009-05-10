class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://www.justinbeck.com/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    = 'Your account has been activated!'
    @body[:url] = "http://www.justinbeck.com/"
  end

  def comment(subject, username)
    setup_email(User.find(1))
    @subject    = 'New comment on the blog!'
    @body       = username + ' commented on ' + subject
    logger.info "Email sent to " + @recipients
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "admin@justinbeck.com"
      @subject     = "www.justibeck.com "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
