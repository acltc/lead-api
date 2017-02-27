class Lead < ApplicationRecord
  # after_create :send_text, :send_first_email

  def send_text
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER']
    text_to_number = phone

    @client = Twilio::REST::Client.new account_sid, auth_token

    if Setting.first.active
      message = @client.messages.create({ :from => twilio_number,
                                          :to => text_to_number,
                                          :body => "Hello from Actualize! Are you available to chat?"
                                        })
    end
  end

  def send_first_email
    LeadMailer.first_message(self).deliver
  end
end
