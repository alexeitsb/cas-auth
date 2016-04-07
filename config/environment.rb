# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Load vars from local file.
vars = File.join(Rails.root, 'config', 'vars.rb')
load(vars) if File.exists?(vars)

# Initialize the Rails application.
Rails.application.initialize!
