require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(30.seconds, :create_user_password) { Works.create_user_password }
every(30.seconds, :callback_user) { Works.callback_user }
every(30.seconds, :send_email) { Works.send_email }
every(30.seconds, :send_sms) { Works.send_sms }
