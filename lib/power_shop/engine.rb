require 'rails'
require 'awesome_nested_set'
require 'pg'
require 'acts_as_shopping_cart'

module PowerShop
  class Engine < Rails::Engine
    isolate_namespace PowerShop
  end
end
