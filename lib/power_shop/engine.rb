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
    config.autoload_paths += %W(#{config.root}/lib)
    config.i18n.load_path += Dir[config.root.join('locales', '*.{rb,yml}').to_s]


    initializer 'power_shop' do |app|
      #app.middleware.use PowerShop::Middleware::ShoppingCart
      app.config.paths['db/migrate'].concat(config.paths['db/migrate'].expanded)
    end

    initializer :power_shop_factories, after: "factory_girl.set_factory_paths" do |app|
      if defined?(FactoryGirl)
        FactoryGirl.definition_file_paths << root.join('spec', 'factories')
      end
    end
  end
end
