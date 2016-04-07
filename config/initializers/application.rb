require "bcrypt"

# Load YAML files.
SETTINGS = YAML.load(ERB.new(File.read("#{Rails.root}/config/settings.yml")).result)[Rails.env]
