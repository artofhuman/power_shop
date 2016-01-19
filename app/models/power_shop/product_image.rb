module PowerShop
  class ProductImage < ActiveRecord::Base
    self.abstract_class = true

    belongs_to :product
  end
end
