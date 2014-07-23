require 'rails'
require 'awesome_nested_set'
require 'pg'

module PowerShop
  class Engine < Rails::Engine
    isolate_namespace PowerShop
  end
end
