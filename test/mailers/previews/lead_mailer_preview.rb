# Preview all emails at http://localhost:3000/rails/mailers/lead_mailer
class LeadMailerPreview < ActionMailer::Preview
  def preview_first_message
    LeadMailer.first_message(Lead.first)
  end
end
