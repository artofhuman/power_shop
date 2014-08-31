require 'rails'
require 'pg'

require 'awesome_nested_set'
require 'acts_as_shopping_cart'
require 'carrierwave'
require 'friendly_id'
require 'kaminari'
require 'validates_email_format_of'

module PowerShop
  class Engine < Rails::Engine
    isolate_namespace PowerShop

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'power_shop.add_middleware' do |app|
      app.middleware.use PowerShop::Middleware::ShoppingCart
    end
  end
end
