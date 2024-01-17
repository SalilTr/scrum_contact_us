class ReplyMailer < ApplicationMailer
  def send_reply_data(reply)
    @reply = reply
    mail(to: 'devsalil.tripathi@gmail.com', subject: 'New Reply Created')
  end
end
