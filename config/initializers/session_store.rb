# Be sure to restart your server when you modify this file.
ActiveRecord::SessionStore.session_class = Session
Auth::Application.config.session_store :active_record_store
# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Auth::Application.config.session_store :active_record_store
