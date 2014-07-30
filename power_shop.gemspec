$:.push File.expand_path("../lib", __FILE__)

require "power_shop/version"

Gem::Specification.new do |s|
  s.name = 'power_shop'
  s.version = PowerShop::VERSION
  s.authors = ["Semyon Pupkov"]
  s.summary = "Simple and flexible Ruby On Rails Ecomerce engine"
  s.description = "Simple and flexible Ruby On Rails Ecomerce engine"

  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '~> 4.0.0'
  s.add_dependency 'awesome_nested_set'
  s.add_dependency 'pg'
  #s.add_dependency 'active_admin-awesome_nested_set'

  s.add_dependency 'acts_as_shopping_cart', '~> 0.2.1'

  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'

  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'pry-byebug'

end
