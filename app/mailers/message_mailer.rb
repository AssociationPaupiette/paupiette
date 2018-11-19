class MessageMailer < ApplicationMailer

  def notification_email
    @from = params[:from]
    @to = params[:to]
    @url = my_conversation_url(user_slug: @from.slug)
    mail to: @to.email, subject: 'Vous avez un message'
  end
end
