class LeadMailer < ApplicationMailer
  default from: Setting.first.email

  def first_message(lead)
    @lead = lead
    mail(to: @lead.email, subject: 'Hello from Actualize!')
  end
end
