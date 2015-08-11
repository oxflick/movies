class NotificationsMailer < ActionMailer::Base
  default from: "Funky Flick <flickfunky@gmail.com>"
  default to: "Funky Flick <flickfunky@gmail.com>" 


  def send_new_user_message(user)
    @user = user
    mail(:to => 'flick@funkyflick.com', :subject => "New User has been created.")
  end

end
