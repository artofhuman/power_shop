module PowerShop
  class ShopImage < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'shop_images'

    belongs_to :subject, polymorphic: true
  end
end
