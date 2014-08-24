ENV["RAILS_ENV"] = "test"
require 'simplecov'
SimpleCov.start

require 'active_support'

require File.expand_path("../dummy/config/application.rb",  __FILE__)
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'factory_girl_rails'
require 'shoulda/matchers'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  ActiveSupport::Deprecation.silenced = true
end
