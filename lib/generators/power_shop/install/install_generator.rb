require 'rails/generators/active_record'

module PowerShop
  module Generators
    class InstallGenerator < ActiveRecord::Generators::Base
      desc "Installs Power Shop"

      def self.source_root
        @_power_shop_source_root ||= File.expand_path("../templates", __FILE__)
      end

      def setup_directory
        empty_directory "app/admin"

        template 'active_admin/category.rb.erb', 'app/admin/category.rb'
        template 'active_admin/product.rb.erb', 'app/admin/product.rb'
        template 'active_admin/order.rb', 'app/admin/order.rb'
      end
    end
  end
end
