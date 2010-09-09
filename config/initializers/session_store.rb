# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_xen_inventory_session',
  :secret      => '62eea9d960c315d8e47cab1be7200a45e3bf2ce5e68a4c34eed1411826942ade639c74fea05f9dced11f3fb6e524d44590cf1b9abc5fff55340c231d29c2d32f'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
