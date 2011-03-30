# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_gincid_session',
  :secret      => 'f4e7448df203db03572c14858fbe4b802b6d8df1f975acc016c8b1f71697987adc89f6b8762ea34140b35cceca970bff8c0e16959241f6b8d29c7866b02a8944'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
