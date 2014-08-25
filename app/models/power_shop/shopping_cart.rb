module PowerShop
  class ShoppingCart < ActiveRecord::Base
    acts_as_shopping_cart
    self.table_name = 'shopping_carts'

    def tax_pct; 0 end
  end
end
