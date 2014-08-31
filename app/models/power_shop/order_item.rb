module PowerShop
  class OrderItem < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'order_items'

    belongs_to :order, class_name: '::Order'
    belongs_to :product, class_name: '::Product'
  end
end
