# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_memorails_session',
  :secret      => '9b5c3793e41153587896d165ae930a7db98386356dd91dcaf2031d87d28ac65e4558b808c3597a601ee337a6eae725119af80bbf3ddf9c2547843cc3b19ad92c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
