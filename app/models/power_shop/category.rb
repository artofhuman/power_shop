module PowerShop
  class Category < ActiveRecord::Base
    self.abstract_class = true
    self.table_name = 'categories'

    acts_as_nested_set

    has_many :products

    validates :name, presence: true
  end
end
