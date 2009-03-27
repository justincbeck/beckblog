# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_justinbeck_session',
  :secret      => 'b83f6a8c4e5078070782ff06f04f0abd770a4573a39dde82ebc5b0c5c84bccdc95bf17c40647314f493b05fee82c255854839ef0c08ac97cb9c73230ee84aaa6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
