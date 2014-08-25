module PowerShop
  class ShoppingCartItem < ActiveRecord::Base
    acts_as_shopping_cart_item
    self.table_name = 'shopping_cart_items'
  end
end
