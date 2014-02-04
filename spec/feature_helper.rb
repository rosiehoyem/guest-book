require 'spec_helper'
require 'capybara/rails'
require 'capybara/rspec'
require 'rack_session_access/capybara'
 
Rails.application.config do
  config.middleware.use RackSessionAccess::Middleware
end