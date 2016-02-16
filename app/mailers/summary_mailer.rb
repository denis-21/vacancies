class SummaryMailer < ApplicationMailer
  def received(client, user)
    @client = client
    @user = user
    mail(to: @client.email, subject: 'Sending report summary')
  end

  def accepted(client, user)
    @client = client
    mail(from: user.email, to: @client.email, subject: 'Thanks for sending resume')
  end

  def rejected(client, user)
    @client = client
    mail(from: user.email, to: @client.email, subject: 'Thanks for sending resume')
  end
end
