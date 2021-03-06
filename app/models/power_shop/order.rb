module PowerShop
  class Order < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'orders'

    has_many :order_items, class_name: '::OrderItem'
  end
end
