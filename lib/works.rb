module Works
  extend self

  def create_user_password
    CasinoUser.create_password.each do |user|
      password = SecureRandom.hex(4)
      user.update_attributes(password: password)
      Notification.create(entity: Notification.entities["sms"], to: user.telephone, body: Templates::SmsCreatePassword.new(user, password).body)
    end
  end

  def send_email
    url = SETTINGS["postmark"]["api"]["uri"]
    Notification.email.to_send.each do |notification|
      body = Hash.new
      body["From"] = notification.from
      body["To"] = notification.to
      body["Subject"] = notification.subject
      body["HtmlBody"] = notification.body
      body["Tag"] = notification.tag
      response = HTTParty.post(url,
                 headers: { "Accept" => "application/json",
                            "Content-Type" => "application/json",
                            "X-Postmark-Server-Token" => ENV["POSTMARK_API_KEY"] },
                 body: body.to_json)
      if response["ErrorCode"] == 0
        notification.update_attributes(message_id: response["MessageID"], requested_at: Time.now)
      end
    end
  end

  def send_sms
    url = SETTINGS["smsgateway"]["api"]["uri"]
    Notification.sms.to_send.each do |notification|
      body = Hash.new
      body["email"] = ENV["SMSGATEWAY_EMAIL"]
      body["password"] = ENV["SMSGATEWAY_PASSWORD"]
      body["device"] = ENV["SMSGATEWAY_DEVICE"]
      body["number"] = notification.to
      body["message"] = notification.body
      response = HTTParty.post(url, body: body)
      if response.parsed_response["result"]["success"].present?
        notification.update_attributes(message_id: response.parsed_response["result"]["success"][0]["id"], requested_at: Time.now)
      end
    end
  end
end
