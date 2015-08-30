class NotificationsMailer < ActionMailer::Base
  default from: "Funky Flick <flickfunky@gmail.com>"
  default to: "Funky Flick <flickfunky@gmail.com>" 


  def send_new_user_message(user)
    @user = user
    mail(:to => 'flick@funkyflick.com', :subject => "New User has been created.")
  end

  def send_new_comment_to_admin(review)
    @review = review
    mail(:to => 'flick@funkyflick.com', :subject => "New review has been created.")
  end

  def send_new_vote_to_admin(similarity)
    @similarity = similarity
    mail(:to => 'flick@funkyflick.com', :subject => "Someone voted or downvoted")
  end

end
