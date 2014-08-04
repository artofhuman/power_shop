require 'rails'
require 'pg'

require 'awesome_nested_set'
require 'acts_as_shopping_cart'
require 'carrierwave'

module PowerShop
  class Engine < Rails::Engine
    isolate_namespace PowerShop
  end
end
