class LeadMailer < ApplicationMailer
  default from: Setting.first.email

  def first_message(lead)
    attachments.inline['actualize-logo.png'] = File.read('app/assets/images/actualize-logo.png')
    @lead = lead
    mail(to: @lead.email, subject: 'Hello from Actualize!')
  end
end
