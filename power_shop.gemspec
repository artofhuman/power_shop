$:.push File.expand_path("../lib", __FILE__)

require "power_shop/version"

Gem::Specification.new do |s|
  s.name = 'power_shop'
  s.version = PowerShop::VERSION
  s.authors = ["Semyon Pupkov"]
  s.summary = "Simple and flexible Ruby On Rails Ecomerce engine"
  s.description = "Simple and flexible Ruby On Rails Ecomerce engine"

  s.add_dependency 'rails', '~> 4.1.0'
  s.add_dependency 'awesome_nested_set'

  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'
end
