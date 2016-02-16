class CompanyMailer < ApplicationMailer
  def disable_email(company)
    send_email(company, 'Create company')
  end

  def active_email(company)
    send_email(company, 'Activate company')
  end

  def reject_email(company)
    send_email(company, 'Rejected company')
  end

  private

  def send_email(company, subject)
    @company = company
    @user = @company.creator
    mail(to: @user.email, subject: subject)
  end
end
