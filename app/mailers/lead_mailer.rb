class LeadMailer < ApplicationMailer
  default from: Setting.first.email

  def first_message(lead)
    @lead = lead
    mail(to: @lead.email, subject: '[TEST] Lead Initial Contact Email')
  end
end
