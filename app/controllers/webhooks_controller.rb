class WebhooksController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def twilio
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER']
    fwd_number = Setting.first.phone
    @lead = Lead.find_by(phone: params["From"])
    from = params["From"]
    body = params["Body"]
    text_body = "#{@lead.first_name} (#{from}): #{body}"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create({ :from => twilio_number,
                                        :to => fwd_number,
                                        :body => text_body
                                      })

    if @lead
      if @lead.update(active: false)
        render json: @lead
      else
        render json: @lead.errors, status: :unprocessable_entity
      end
    else
      head :no_content
    end
  end

  def sendgrid
    @lead = Lead.find_by(email: params["From"])
    if @lead
      if @lead.update(active: false)
        render json: @lead
      else
        render json: @lead.errors, status: :unprocessable_entity
      end
    else
      head :no_content
    end
  end
end
