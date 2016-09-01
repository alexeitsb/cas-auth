require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(30.seconds, :create_user_password) { Works.create_user_password }
every(30.seconds, :callback_client) { Works.callback_client }
every(30.seconds, :notify) { Works.notify }