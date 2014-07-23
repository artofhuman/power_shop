module PowerShop
  class Category < ActiveRecord::Base
    self.abstract_class = true

    acts_as_nested_set
  end
end
