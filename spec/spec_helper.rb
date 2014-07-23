ENV["RAILS_ENV"] ||= "test"

require File.expand_path("../dummy/config/application.rb",  __FILE__)
require File.expand_path("../dummy/config/environment.rb",  __FILE__)

require 'rspec/rails'
require 'shoulda/matchers'

Rails.backtrace_cleaner.remove_silencers!

RSpec.configure do |config|
end
