# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  unless File.exists?(token_file)
    # Generate a new token and store it in token_file.
    File.write(token_file, SecureRandom.hex(64))
  end
  File.read(token_file).chomp
end

Depot2::Application.config.secret_token = secure_token
