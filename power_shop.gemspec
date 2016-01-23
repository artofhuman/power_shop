$:.push File.expand_path("../lib", __FILE__)

require "power_shop/version"

Gem::Specification.new do |s|
  s.name = 'power_shop'
  s.version = PowerShop::VERSION
  s.authors = ["Semyon Pupkov"]
  s.email   = ["semen.pupkov@gmail.com"]
  s.homepage = "https://github.com/artofhuman/power_shop"
  s.summary = "Simple and flexible Ruby On Rails Ecomerce engine"
  s.description = "Simple and flexible Ruby On Rails Ecomerce engine"

  s.licenses = ['MIT']

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'rails'
  s.add_dependency 'awesome_nested_set'

  s.add_dependency 'carrierwave'
  s.add_dependency 'kaminari'
  s.add_dependency 'mini_magick'
  s.add_dependency 'validates_email_format_of'

  s.add_dependency 'acts_as_shopping_cart'
  s.add_dependency 'friendly_id', '~> 5.0.0'

  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rspec-core'
  s.add_development_dependency 'rspec-rails', '~> 3.0.0'
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl_rails'

  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'pry-byebug'
end
