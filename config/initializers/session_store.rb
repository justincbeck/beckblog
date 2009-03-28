# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_justinbeck_session',
  :secret      => 'aa7e30dd724fa24688fe4ec415b9ea846d1203e6def9ea3c7be8c82f56f7bb7e49fb6a2bd51a85fef2a648a25e5bc8e685a5fcd40ef57c4f4f256b17aeb09587'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
