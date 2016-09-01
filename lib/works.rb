module Works
  extend self

  def create_user_password
    CASinoUser.create_password.each do |user|
      password = SecureRandom.hex(4)
      user.update_attributes(password: password)
      Notification.create(entity: Notification.entities["sms"], to: user.telephone, body: Templates::SmsCreatePassword.new(user, password).body)
    end
  end

  def callback_client
    CASinoUserClient.to_callback.each do |casino_user_client|
      begin
        response = HTTParty.post(casino_user_client.client.callback_uri, body: { username: casino_user_client.casino_user.username, name: casino_user_client.casino_user.name, document: casino_user_client.casino_user.document, email: casino_user_client.casino_user.email, telephone: casino_user_client.casino_user.telephone })
        casino_user_client.casino_user.update_attributes(updated: false) if response.code == 200
      rescue
        next
      end
    end
  end

  def notify
    return unless (notifier_uri = SETTINGS["notifier"]["api"]["uri"]).present?
    Notification.to_send.each do |notification|
      if notification.email?
        url = "#{notifier_uri}/api/add_email"
        body = { from: notification["from"],
                 to: notification["to"],
                 cc: notification["cc"],
                 bcc: notification["bcc"],
                 reply_to: notification["reply_to"],
                 headers: notification["headers"],
                 subject: notification["subject"],
                 body: notification["body"],
                 attachments: notification["attachments"],
                 tag: notification["tag"]
               }
      elsif notification.sms?
        url = "#{notifier_uri}/api/add_sms"
        body = { to: notification["to"],
                 body: notification["body"]
               }
      end
      response = HTTParty.post(url,
                 headers: { "Accept" => "application/json",
                            "Content-Type" => "application/json",
                            "token" => ENV["NOTIFIER_TOKEN"] },
                 body: body.to_json)
      if response.code == 200
        notification.update_attributes(message_id: response["id"], requested_at: Time.now)
      end
    end
  end
end
