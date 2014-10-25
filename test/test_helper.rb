require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'faker'
require 'capybara/rails'
require_relative 'support/test_password_helper'
require 'database_cleaner'

Capybara.server_port = 31337

class ActiveSupport::TestCase
  include TestPasswordHelper

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

end

ActiveRecord::FixtureSet.context_class.send :include, TestPasswordHelper

DatabaseCleaner.strategy = :truncation
